// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarked_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkedUserModelAdapter extends TypeAdapter<BookmarkedUserModel> {
  @override
  final int typeId = 1;

  @override
  BookmarkedUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookmarkedUserModel(
      userId: fields[0] as int,
      displayName: fields[1] as String,
      profileImage: fields[2] as String?,
      reputation: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BookmarkedUserModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.displayName)
      ..writeByte(2)
      ..write(obj.profileImage)
      ..writeByte(3)
      ..write(obj.reputation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkedUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
