// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todolistModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoListModelAdapter extends TypeAdapter<TodoListModel> {
  @override
  final int typeId = 0;

  @override
  TodoListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoListModel(
      title: fields[0] as String,
      date: fields[1] as String,
      time: fields[2] as String,
      description: fields[3] as String,
      completed: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoListModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
