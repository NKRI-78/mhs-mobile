part of '../view/begining_tour_page.dart';

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeginingTourCubit, BeginingTourState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                listTour.length,
                (index) => Container(
                  margin: const EdgeInsets.only(
                    right: 6,
                  ),
                  height: 16,
                  width: 16,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 14,
                      width: 14,
                      child: Center(
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: index == state.index
                                ? circleSelect
                                : circleUnselect,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      );
    });
  }
}
