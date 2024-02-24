import 'package:flutter/material.dart';
import 'package:secure_fitness_comp/Screens/Enthusist/workOut/workOutScreen.dart';
import 'package:secure_fitness_comp/resources/appColors.dart';
import 'package:secure_fitness_comp/resources/components/appbar.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:secure_fitness_comp/resources/height_width.dart';
import 'package:sizer/sizer.dart';

class WorkOutDetails extends StatefulWidget {
  WorkOuts? workOuts;

  WorkOutDetails({Key? key, this.workOuts}) : super(key: key);

  @override
  State<WorkOutDetails> createState() => _WorkOutDetailsState();
}

class _WorkOutDetailsState extends State<WorkOutDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(
          context: context, title: "${widget.workOuts?.name}", isAuto: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: "${widget.workOuts?.name}",
                child: Image.asset(
                  "${widget.workOuts?.image}",
                  height: 15.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            height(1),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Row(
                children: [
                  Text(
                    "${widget.workOuts?.time} min",
                    style: MessageFonts.notifyW6(),
                  ),
                  width(2),
                  Text(
                    "${widget.workOuts?.exercies} exercise",
                    style: MessageFonts.notifyW6(),
                  ),
                ],
              ),
            ),
            height(2),
            Padding(
              padding: EdgeInsets.all(2.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.workOuts?.exercies,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  var workOut = widget.workOuts;
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade100),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12)),
                          child: Image.asset(
                            "${workOut?.image}",
                            height: 10.h,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        height(2),
                        Text(
                          "Jumping jacks",
                          style: MessageFonts.notifySimple(),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
