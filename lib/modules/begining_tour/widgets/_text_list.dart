part of '../view/begining_tour_page.dart';

class _TextList extends StatelessWidget {
  const _TextList({super.key, required this.tour});

  final BeginingTour tour;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tour.title,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: blackColor
          ),
        ),
        Text(
          tour.description,
          maxLines: 4,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: blackColor
          ),
        ),
      ],
    );
  }
}