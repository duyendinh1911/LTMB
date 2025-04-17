import 'package:flutter/material.dart';
import 'package:app_01/noteApp/db/NoteDatabaseHelper.dart';
import "package:app_01/noteApp/model/NoteModel.dart";
import "package:app_01/noteApp/ui/NoteForm.dart";
import "package:app_01/noteApp/ui/NoteItem.dart";

class NoteListScreen extends StatefulWidget {
  final VoidCallback onThemeChanged;
  final bool isDarkMode;
  final Function(BuildContext) onLogout; // Sửa từ VoidCallback thành Function(BuildContext)

  const NoteListScreen({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
    required this.onLogout,
  });

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  late Future<List<Note>> _notesFuture;
  bool isGridView = false;

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  Future<void> _refreshNotes() async {
    setState(() {
      _notesFuture = NoteDatabaseHelper.instance.getAllNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ghi Chú Của Bạn', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              color: widget.isDarkMode ? Colors.yellow : Colors.blue,
            ),
            onPressed: widget.onThemeChanged,
            tooltip: widget.isDarkMode ? 'Chuyển sang chế độ sáng' : 'Chuyển sang chế độ tối',
          ),
          IconButton(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                isGridView ? Icons.list : Icons.grid_view,
                key: ValueKey<bool>(isGridView),
              ),
            ),
            onPressed: () => setState(() => isGridView = !isGridView),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshNotes,
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                _showLogoutDialog();
              }
            },
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Đăng xuất'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<Note>>(
        future: _notesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Đã xảy ra lỗi: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Không có ghi chú nào'),
            );
          } else {
            return RefreshIndicator(
              onRefresh: _refreshNotes,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isGridView
                    ? GridView.builder(
                  key: const ValueKey<String>('grid'),
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => NoteItem(
                    note: snapshot.data![index],
                    onDelete: _refreshNotes,
                  ),
                )
                    : ListView.builder(
                  key: const ValueKey<String>('list'),
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => NoteItem(
                    note: snapshot.data![index],
                    onDelete: _refreshNotes,
                  ),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final created = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NoteFormScreen()),
          );
          if (created == true) {
            _refreshNotes();
          }
        },
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận đăng xuất'),
        content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              widget.onLogout(context); // Sửa để gọi onLogout với context
            },
            child: const Text(
              'Đăng xuất',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}