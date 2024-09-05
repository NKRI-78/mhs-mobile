import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/list_brochure/cubit/list_brocure_cubit.dart';
import 'package:mhs_mobile/modules/list_brochure/widgets/card_brochure.dart';
import 'package:mhs_mobile/modules/list_presentation/model/gallery_item_model.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class ListBrochurePage extends StatelessWidget {
  const ListBrochurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBrocureCubit()..fetchBrochure(),
      child: const ListBrochureView(),
    );
  }
}

class ListBrochureView extends StatefulWidget {
  const ListBrochureView({super.key});

  @override
  State<ListBrochureView> createState() => _ListBrochureViewState();
}

class _ListBrochureViewState extends State<ListBrochureView> {
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
    return BlocBuilder<ListBrocureCubit, ListBrocureState>(
      builder: (context, st) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
            ),
            title: const Text(
              "Brosur", 
              style: TextStyle(
                color: whiteColor,
              ),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: whiteColor,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(70))
                ),
              ),
            )
          ),
          backgroundColor: whiteColor,
          body: SafeArea(
            child: Container(
              constraints:
                  BoxConstraints.expand(height: MediaQuery.of(context).size.height),
              child: Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onVerticalDragEnd: (details) {},
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: st.document.length,
                        itemBuilder: (context, index) =>
                            _buildImage(st.presentationImage[index]),
                      ),
                    ),
                  ),
                    SizedBox(
                      height: 80,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: st.presentationImage
                              .map((e) => _buildLitImage(e))
                              .toList(),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  // build image with zooming
  Widget _buildImage(GalleryItemModel item) {
    return Hero(
      tag: item.id,
      child: Center(
        child: ImageCard(
          image: item.imageUrl,
          radius: 0, 
        ),
      ),
    );
  }

// build image with zooming
  Widget _buildLitImage(GalleryItemModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _controller.jumpToPage(item.index);
          });
        },
        child: ImageCard(
          height: _currentPage == item.index ? 70 : 60,
          width: _currentPage == item.index ? 70 : 60,
          fit: BoxFit.cover,
          image: item.imageUrl,
          radius: 10,
        ),
      ),
    );
  }
}