import 'package:flutter/material.dart';

import '../../domain/entities/user_entity.dart';

class UserListItem extends StatelessWidget {
  final UserEntity user;
  final Function(UserEntity)? onBookmarkToggle;
  final Function(UserEntity)? onUserTap;

  const UserListItem({
    super.key,
    required this.user,
    required this.onBookmarkToggle,
    required this.onUserTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage:
              user.profileImage != null
                  ? NetworkImage(user.profileImage!)
                  : null,
          child: user.profileImage == null ? const Icon(Icons.person) : null,
        ),
        title: Text(
          user.displayName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('Reputation: ${user.reputation}'),
            if (user.location != null) ...[
              const SizedBox(height: 2),
              Text(
                'Location: ${user.location}',
                style: const TextStyle(fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if (user.badgeCounts != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  _BadgeTile(
                    icon: Icons.circle,
                    color: Colors.amber,
                    count: user.badgeCounts!.gold,
                    label: 'Gold',
                  ),
                  const SizedBox(width: 8),
                  _BadgeTile(
                    icon: Icons.circle,
                    color: Colors.grey[400]!,
                    count: user.badgeCounts!.silver,
                    label: 'Silver',
                  ),
                  const SizedBox(width: 8),
                  _BadgeTile(
                    icon: Icons.circle,
                    color: Colors.brown[300]!,
                    count: user.badgeCounts!.bronze,
                    label: 'Bronze',
                  ),
                ],
              ),
            ],
          ],
        ),
        trailing:
            onBookmarkToggle == null
                ? null
                : IconButton(
                  icon: Icon(
                    user.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: user.isBookmarked ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () => onBookmarkToggle?.call(user),
                ),
        onTap: () => onUserTap?.call(user),
      ),
    );
  }
}

class _BadgeTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final int count;
  final String label;

  const _BadgeTile({
    required this.icon,
    required this.color,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 10),
          const SizedBox(width: 2),
          Text(
            count.toString(),
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
