import 'package:addidas_ecommerce_app/components/custom_button/custom_button1.dart';
import 'package:addidas_ecommerce_app/components/custom_text_field/custom_textfield1.dart';
import 'package:addidas_ecommerce_app/providers/auth_provider.dart';
import 'package:addidas_ecommerce_app/providers/profile_provider.dart';
import 'package:flutter/material.dart';
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(auth.userModel!.image),
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
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
