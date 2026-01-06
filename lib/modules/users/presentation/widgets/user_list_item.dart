import 'package:flutter/material.dart';

import '../../domain/entities/user_entity.dart';

class UserListItem extends StatelessWidget {
  final UserEntity user;
  final Function(UserEntity) onBookmarkToggle;
  final Function(UserEntity) onUserTap;

  const UserListItem({
    Key? key,
    required this.user,
    required this.onBookmarkToggle,
    required this.onUserTap,
  }) : super(key: key);

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
        title: GestureDetector(
          onTap: () => onUserTap(user),
          child: Text(
            user.displayName,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        subtitle: Text('Reputation: ${user.reputation}'),
        trailing: IconButton(
          icon: Icon(
            user.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: user.isBookmarked ? Colors.blue : Colors.grey,
          ),
          onPressed: () => onBookmarkToggle(user),
        ),
        onTap: () => onUserTap(user),
      ),
    );
  }
}
