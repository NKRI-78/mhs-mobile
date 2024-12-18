part of '../view/begining_tour_page.dart';

// ignore: unused_element
class _BottomInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeginingTourCubit, BeginingTourState>(
        builder: (context, state) {
      return Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            bottomInfo,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: listTour
                    .map((e) => _TextList(
                          tour: e,
                        ))
                    .toList(),
              ))
        ],
      );
    });
  }
}
