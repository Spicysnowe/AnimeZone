import 'package:anime_zone/core/constants/colors.dart';
import 'package:anime_zone/core/constants/fontFamily.dart';
import 'package:anime_zone/core/utils/scaling.dart';
import 'package:anime_zone/presentation/views/auth/details/detailsSet1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Widget> widgetOptions = [
  const DetailsSet1(),
  const DetailsSet2(),
  const DetailsSet3()
];

class Deatils extends StatefulWidget {
  const Deatils({super.key});

  @override
  State<Deatils> createState() => _DeatilsState();
}

class _DeatilsState extends State<Deatils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black1,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: scaleWidth(24, context),
                vertical: scaleHeight(24, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's Get to Know You",
                  style: GoogleFonts.getFont(fontFamily1,
                      color: Colors.white, fontSize: scaleHeight(16, context)),
                ),
                SizedBox(
                  height: scaleHeight(8, context),
                ),
                CustomRowContainers(),
                Flexible(
                  child: Center(
                    child: widgetOptions.elementAt(0),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CustomRowContainers extends StatelessWidget {
  const CustomRowContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scaleHeight(10, context),
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Expanded(
            child: CustomContainer(
              color: purple,
            ),
          ),
          SizedBox(width: scaleWidth(4, context)),
          const Expanded(
            child: CustomContainer(color: purple),
          ),
          SizedBox(width: scaleWidth(4, context)),
          const Expanded(
            child: CustomContainer(color: purple),
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Color color;
  final Widget? child;

  const CustomContainer({Key? key, required this.color, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
    );
  }
}



class DetailsSet2 extends StatelessWidget {
  const DetailsSet2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class DetailsSet3 extends StatelessWidget {
  const DetailsSet3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
