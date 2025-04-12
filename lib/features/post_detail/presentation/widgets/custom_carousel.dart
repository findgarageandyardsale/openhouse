import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:open_house/shared/domain/models/attachment_file/attachment_model.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/widgets/file_image_builder.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key, required this.attachments, this.radius});
  final List<AttachmentModel> attachments;
  final double? radius;

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CustomCarousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return widget.attachments.isEmpty
        ? const SizedBox.shrink()
        : Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(widget.radius ?? 0),
              child: CarouselSlider(
                items:
                    widget.attachments.map((e) {
                      return FileImageBuilder(
                        url: e.file ?? '',
                        clickUrl: e.file ?? '',
                        height: 356,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        radius: widget.radius ?? 0,
                      );
                    }).toList(),
                carouselController: _controller,
                options: CarouselOptions(
                  height: 250,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 700),
                  autoPlayCurve: Curves.linear,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left:
                  MediaQuery.of(context).size.width / 2 -
                  ((widget.attachments.length * 20 + 8) / 2),
              child: Row(
                children:
                    widget.attachments.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 2.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (_current == entry.key)
                                    ? AppColors.lightGrey
                                    : Colors.white,
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        );
  }
}
