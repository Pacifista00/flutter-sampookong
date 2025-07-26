import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  int _selectedRating = 0;

  List<dynamic> _ratings = [];

  @override
  void initState() {
    super.initState();
    _fetchRatings();
  }

  Future<void> _fetchRatings() async {
    final response = await http.get(
      Uri.parse('http://10.112.102.121:8000/api/ratings'),
    );
    if (response.statusCode == 200) {
      setState(() {
        _ratings = json.decode(response.body);
      });
    } else {
      debugPrint('Failed to load ratings');
    }
  }

  Future<void> _submitRating() async {
    final nama = _namaController.text;
    final deskripsi = _deskripsiController.text;
    final rating = _selectedRating;

    if (nama.isEmpty || deskripsi.isEmpty || rating == 0) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('rate_info'.tr())));
      return;
    }

    final response = await http.post(
      Uri.parse('http://10.112.102.121:8000/api/ratings/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nama': nama,
        'deskripsi': deskripsi,
        'rating': rating,
      }),
    );

    if (response.statusCode == 201) {
      _namaController.clear();
      _deskripsiController.clear();
      setState(() => _selectedRating = 0);
      await _fetchRatings();

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('rate_success'.tr())));
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('rate_failed'.tr())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('rating'.tr())),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _ratings.length,
              itemBuilder: (context, index) {
                final item = _ratings[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildRatingCard(item),
                );
              },
            ),
          ),
          const Divider(height: 0),
          _buildForm(context),
        ],
      ),
    );
  }

  Widget _buildRatingCard(dynamic item) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['nama'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Row(
              children: List.generate(5, (i) {
                return Icon(
                  i < (item['rating'] ?? 0) ? Icons.star : Icons.star_border,
                  size: 20,
                  color: Colors.orange,
                );
              }),
            ),
            const SizedBox(height: 6),
            Text(item['deskripsi'] ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05), // pengganti withOpacity(0.05)
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'rate_instructions'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _namaController,
            decoration: InputDecoration(
              label: Text('rate_name'.tr()),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _deskripsiController,
            maxLines: 2,
            decoration: InputDecoration(
              label: Text('rate_desc'.tr()),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(5, (index) {
              final isSelected = index < _selectedRating;
              return IconButton(
                onPressed: () {
                  setState(() {
                    _selectedRating = index + 1;
                  });
                },
                icon: Icon(
                  isSelected ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitRating,
              child: Text('rate_send'.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
