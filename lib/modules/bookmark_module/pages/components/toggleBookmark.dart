import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/modules/bookmark_module/controller/bookmark_controller.dart';
import 'package:newsapp/modules/bookmark_module/pages/bookmarkPage.dart';

class ToggleServices extends StatelessWidget {
  const ToggleServices({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookMarkController>(builder: (orderController) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: orderController.buttonIndex == 0
                      ? Colors.purple
                      : const Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () =>
                    orderController.updateContainerPosition(0, context),
                child: orderController.buttonIndex == 0
                    ? ServiceButtons(
                        service: "News",
                        serviceColor: Colors.white,
                      )
                    : ServiceButtons(
                        service: "News",
                      ),
              )),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: orderController.buttonIndex == 1
                    ? Colors.purple
                    : const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () =>
                  orderController.updateContainerPosition(1, context),
              child: orderController.buttonIndex == 1
                  ? ServiceButtons(
                      service: "Headlines",
                      serviceColor: Colors.white,
                    )
                  : ServiceButtons(service: "Headlines"),
            ),
          ),
        ],
      );
    });
  }
}
