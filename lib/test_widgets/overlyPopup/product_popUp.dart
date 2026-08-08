import 'package:flutter/material.dart';



class ProductActionPanel extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDuplicate;
  final VoidCallback onDelete;

  const ProductActionPanel({
    super.key,
    required this.onEdit,
    required this.onDuplicate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,

      child: SizedBox(
        width: 180,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ActionItem(
              icon: Icons.edit_outlined,
              title: 'Edit',
              onTap: onEdit,
            ),

            _ActionItem(
              icon: Icons.copy_outlined,
              title: 'Duplicate',
              onTap: onDuplicate,
            ),

            _ActionItem(
              icon: Icons.delete_outline,
              title: 'Delete',
              onTap: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ActionItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: SizedBox(
        height: 44,

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),

          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
