import 'dart:io';

List<Map<String, dynamic>> diaryEntries = [];

void addEntry() {
  DateTime now = DateTime.now();
  stdout.write('Enter title (optional, max 40 chars): ');
  String? title = stdin.readLineSync();
  if (title != null && title.length > 40) {
    print('❌ Title must not exceed 40 characters.');
    return;
  }

  stdout.write('Enter your diary content: ');
  String? body = stdin.readLineSync();

  if (body == null || body.trim().isEmpty) {
    print('❌ Entry content cannot be empty.');
    return;
  }

  diaryEntries.add({
    'date': now,
    'title': title,
    'body': body,
  });

  print('✅ Entry added!');
}

void viewEntries() {
  if (diaryEntries.isEmpty) {
    print('📭 No entries found.');
    return;
  }

  for (var entry in diaryEntries.reversed) {
    displayEntry(entry);
  }
}

void searchEntries() {
  stdout.write('🔍 Enter date (YYYY-MM-DD), title, or content to search: ');
  String? query = stdin.readLineSync()?.toLowerCase();

  if (query == null || query.isEmpty) {
    print('❌ Search term cannot be empty.');
    return;
  }

  List<Map<String, dynamic>> results = diaryEntries.where((entry) {
    String dateStr = entry['date'].toString().split(' ').first;
    return dateStr.contains(query) ||
           (entry['title']?.toLowerCase().contains(query) ?? false) ||
           entry['body'].toLowerCase().contains(query);
  }).toList();

  if (results.isEmpty) {
    print('📭 No matching entries found.');
  } else {
    for (var entry in results.reversed) {
      displayEntry(entry);
    }
  }
}

void deleteEntry() {
  stdout.write('🗑️ Enter date (YYYY-MM-DD) or title to delete: ');
  String? input = stdin.readLineSync()?.toLowerCase();

  if (input == null || input.isEmpty) {
    print('❌ Input cannot be empty.');
    return;
  }

  List<Map<String, dynamic>> matches = diaryEntries.where((entry) {
    String dateStr = entry['date'].toString().split(' ').first;
    return dateStr.contains(input) ||
           (entry['title']?.toLowerCase().contains(input) ?? false);
  }).toList();

  if (matches.isEmpty) {
    print('📭 No matching entries to delete.');
    return;
  }

  for (int i = 0; i < matches.length; i++) {
    print('\nMatch ${i + 1}:');
    displayEntry(matches[i]);
  }

  stdout.write('⚠️ Delete ALL these entries? (y/n): ');
  String? confirm = stdin.readLineSync()?.toLowerCase();

  if (confirm == 'y') {
    diaryEntries.removeWhere((entry) {
      String dateStr = entry['date'].toString().split(' ').first;
      return dateStr.contains(input) ||
             (entry['title']?.toLowerCase().contains(input) ?? false);
    });
    print('✅ Entry/entries deleted.');
  } else {
    print('❌ Deletion cancelled.');
  }
}

void exitProgram() {
  print('\n👋 Goodbye! Your diary session has ended.');
}

void displayEntry(Map<String, dynamic> entry) {
  DateTime date = entry['date'];
  String dateStr = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} '
                   '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';

  print('\n📅 Date: $dateStr');
  if (entry['title'] != null && entry['title'].toString().isNotEmpty) {
    print('📝 Title: ${entry['title']}');
  }
  print('---\n${entry['body']}\n---');

  
}
