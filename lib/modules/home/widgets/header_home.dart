part of '../view/home_page.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Selamat datang di,",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      const Text(
                        "Metro Hotel School",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 23,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: greyInputColor.withOpacity(0.5),
                        endIndent: 30,
                      )
                    ],
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        logoMhs,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}