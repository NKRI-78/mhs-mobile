import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/list_presentation/cubit/list_presentation_cubit.dart';
import 'package:mhs_mobile/repositories/document_repository/models/document_model.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class CardPresentation extends StatefulWidget {
  const CardPresentation({super.key});

  @override
  State<CardPresentation> createState() => _CardPresentationState();
}

class _CardPresentationState extends State<CardPresentation> {
  late final PageController _controller =
      PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    _currentPage = 0;
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.toInt() ?? 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListPresentationCubit, ListPresentationState>(
        // buildWhen: (previous, current) => previous.document != current.document,
        builder: (context, st) {
        return Container(
          constraints:
              BoxConstraints.expand(height: MediaQuery.of(context).size.height),
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onVerticalDragEnd: (details) {},
                          child: PageView.builder(
                            controller: _controller,
                            itemCount: st.document.length,
                            itemBuilder: (context, index) =>
                                _buildImage(st.document[index]),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 80,
                          child: Text(
                            "Test dmna lo",
                            style: TextStyle(
                              color: blackColor
                            ),
                          ),
                        ),
                    ],
                  ),
        );
      }
    );
  }
  Widget _buildImage(DocumentData item) {
    return Hero(
      tag: item.id ?? "",
      child: Column(
        children: [
          Center(
            child: ImageCard(image: item.fileUrl ?? "", radius: 0, width: 500, height: 20,),
          ),
          const SizedBox(
                          height: 80,
                          child: Text(
                            "Test dmna lo",
                            style: TextStyle(
                              color: blackColor
                            ),
                          ),
                        ),
        ],
      ),
    );
  }
}