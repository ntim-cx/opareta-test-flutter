import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.white,
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double size = width * 0.15;

    return ListTile(
        leading: Container(
          width: size,
          height: size,
          color: Colors.white,
        ),
        title: Container(
          color: Colors.white,
          height: 30.0,
        ),
        subtitle: Container(
          margin: const EdgeInsets.only(top: 5),
          color: Colors.white,
          height: 20.0,
        ));
  }
}
