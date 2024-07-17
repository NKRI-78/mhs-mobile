part of '../view/begining_tour_page.dart';

class _ContentWidget extends StatelessWidget {
  const _ContentWidget(this.tour);

  final BeginingTour tour;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return BlocBuilder<BeginingTourCubit, BeginingTourState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Container(
              color: primaryColor,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                circleTop,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  height: height * .6,
                  child: Image.asset(tour.assets),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                bottomInfo,
                width: double.infinity,
                height: 210,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _ButtonWidget(),
                    Text(
                      tour.title,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: blackColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            tour.description,
                            maxLines: 4,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: blackColor.withOpacity(0.50),
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: blackColor,
                            ), 
                            onPressed: () { 
                              if (state.index == 2) {
                                context.read<BeginingTourCubit>().finish(context);
                              } else {
                                context.read<BeginingTourCubit>().nextPage();
                              }
                             },
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }
    );
  }
}
