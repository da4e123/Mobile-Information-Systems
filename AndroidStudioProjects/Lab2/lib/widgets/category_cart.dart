// // import 'package:flutter/material.dart';
// //
// // class CategoryCard extends StatelessWidget {
// //   final String category;
// //   final VoidCallback onTap;
// //
// //   CategoryCard({required this.category, required this.onTap});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// //       elevation: 5,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       child: InkWell(
// //         onTap: onTap,
// //         borderRadius: BorderRadius.circular(12),  // Rounded corners for the InkWell
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Row(
// //             children: [
// //               Icon(
// //                 Icons.category,  // You can use any relevant icon
// //                 color: Colors.blue,  // Set the icon color
// //               ),
// //               SizedBox(width: 8),  // Add some space between the icon and the text
// //               Expanded(
// //                 child: Text(
// //                   category.toUpperCase(),
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.blueGrey,  // Customize text color
// //                   ),
// //                   overflow: TextOverflow.ellipsis,  // To handle long category names
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
//
// class CategoryCard extends StatelessWidget {
//   final String category;
//   final VoidCallback onTap;
//
//   const CategoryCard({
//     required this.category,
//     required this.onTap,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 10,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(16),
//           splashColor: Colors.white.withOpacity(0.3),
//           highlightColor: Colors.transparent,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.category,
//                   color: Colors.white,
//                   size: 28,
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Text(
//                     category.toUpperCase(),
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       letterSpacing: 1.2,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String category;
  final VoidCallback onTap;

  const CategoryCard({
    required this.category,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95; // Slightly reduce the size to simulate a press
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0; // Return to normal size
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0; // Reset if tap is cancelled
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            splashColor: Colors.white.withOpacity(0.3),
            highlightColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.category,
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.category.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
