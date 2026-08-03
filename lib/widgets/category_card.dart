import 'package:flutter/material.dart';
import '../models/lesson_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel item;
  final VoidCallback? onTap;

  const CategoryCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: item.bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(item.icon, color: item.color, size: 22),
            ),
            const SizedBox(height: 12),
            Text(
              item.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: item.color,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Text(
                item.description,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}