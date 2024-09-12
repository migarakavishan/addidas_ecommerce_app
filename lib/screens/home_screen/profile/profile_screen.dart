import 'package:addidas_ecommerce_app/components/custom_button/custom_button1.dart';
import 'package:addidas_ecommerce_app/components/custom_text_field/custom_textfield1.dart';
import 'package:addidas_ecommerce_app/controllers/slider_controller.dart';
import 'package:addidas_ecommerce_app/providers/auth_provider.dart';
import 'package:addidas_ecommerce_app/providers/profile_provider.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/admin/admin_screen.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/my_order/my_order.dart';
import 'package:addidas_ecommerce_app/utils/custom_navigators.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Consumer2<AuthProvider, ProfileProvider>(
        builder: (context, auth, profile, child) {
          return Column(
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://t4.ftcdn.net/jpg/05/31/79/83/360_F_531798391_XFz7gyPmDRTAfiEE5sRjFu5NpKrJt4rC.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    GestureDetector(
                      onTap: () {
                        profile.pickProfileImage(context);
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: profile.pickedImage == null
                              ? NetworkImage(auth.userModel!.image)
                              : FileImage(profile.pickedImage!)
                                  as ImageProvider,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 6,
                                right: 6,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor:
                                      Colors.black.withOpacity(0.5),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTextField1(
                        label: "User Name",
                        icon: Icons.person,
                        controller: profile.nameController),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton1(
                      text: "Update",
                      bgColor: Colors.blue,
                      size: size,
                      ontap: () {
                        profile.updateUserData(context);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton1(
                      text: "My Orders",
                      bgColor: Colors.green,
                      size: size,
                      ontap: () {
                        CustomNavigators.goTo(context, const MyOrder());
                      },
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
      floatingActionButton: FutureBuilder(
          future: SliderController().getAdmins(),
          builder: (context, snapshot) {
            String uid =
                Provider.of<AuthProvider>(context, listen: false).user!.uid;

            if (snapshot.connectionState == ConnectionState.waiting) {}
            if (snapshot.hasError) {}
            if (snapshot.hasData) {
              Logger().e(snapshot.data);
            }
            if (snapshot.hasData) {
              return snapshot.data!.contains(uid)
                  ? FloatingActionButton(
                      child: const Icon(Icons.admin_panel_settings),
                      onPressed: () {
                        CustomNavigators.goTo(context, const AdminScreen());
                      },
                    )
                  : const SizedBox();
            }
            return const SizedBox();
          }),
    );
  }
}
