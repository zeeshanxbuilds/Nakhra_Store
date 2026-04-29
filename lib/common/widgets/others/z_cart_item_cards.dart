import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nakhra/features/shop/models/cart_item_model.dart';
import 'package:nakhra/utils/constants/colors.dart';

class ZCartItemCard extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onToggle;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ZCartItemCard({
    super.key,
    required this.item,
    required this.onToggle,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // The "squircle" look
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, spreadRadius: 2)],
      ),
      child: Row(
        children: [
          // 1. Checkbox
          Checkbox(value: item.isSelected, onChanged: (value) => onToggle(), activeColor: ZColors.primary500),

          // 2. Book Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(imageUrl: item.coverImageUrl, width: 60, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),

          // 3. Title and Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "\$${item.price.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.bodyLarge!.apply(color: ZColors.primary500),
                ),
              ],
            ),
          ),

          // 4. Quantity Controls
          Row(
            children: [
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.remove_circle_outline, color: Colors.grey),
              ),
              Text('${item.quantity}', style: Theme.of(context).textTheme.titleMedium),
              IconButton(
                onPressed: onAdd,
                icon: const Icon(Icons.add_circle, color: ZColors.primary500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
