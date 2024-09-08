import 'package:addidas_ecommerce_app/components/custom_button/custom_button1.dart';
import 'package:addidas_ecommerce_app/controllers/order_controller.dart';
import 'package:addidas_ecommerce_app/models/order_model.dart';
import 'package:addidas_ecommerce_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'My Orders',
          style: TextStyle(color: Colors.white),
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: Consumer<AuthProvider>(builder: (context, value, child) {
        return FutureBuilder(
          future: value.fetchMyOrders(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
            List<OrderModel> orders = value.myOrders;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order ID - ${orders[index].orderID}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Status - Paid",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                        Text(
                          "Total Amount - ${orders[index].totalAmount}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Items",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade200,
                        ),
                        Column(
                          children: List.generate(
                              orders[index].items.length,
                              (i) => ListTile(
                                    leading: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: NetworkImage(orders[index]
                                                  .items[i]
                                                  .model
                                                  .image),
                                              fit: BoxFit.cover)),
                                    ),
                                    title: Text(
                                        orders[index].items[i].model.title),
                                    subtitle: Text(
                                        "LKR ${orders[index].items[i].model.price}0"),
                                  )),
                        ),
                        CustomButton1(
                          text: "Cancel Order",
                          bgColor: Colors.red,
                          size: size,
                          ontap: () {
                            OrderController()
                                .cancelOrder(orders[index].orderID);
                            value.removeFromOrders(orders[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
