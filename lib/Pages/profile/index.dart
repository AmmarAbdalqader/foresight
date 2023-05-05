import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Components/FAppBar.dart';
import '../../Constants/FColors.dart';
import '../../Controllers/UserCon.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userCon = context.read<UserCon>();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kBottomNavigationBarHeight),
        child: FAppBar(showUserPhoto: false),
      ),
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const Center(
            child: Icon(
              CupertinoIcons.person_crop_circle,
              color: mainColor,
              size: 100,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            userCon.user!.name,
            style: GoogleFonts.tajawal(
              color: mainColor,
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
