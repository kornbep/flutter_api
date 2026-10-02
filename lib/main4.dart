import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

// Library Header Widget
class LibraryHeader extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const LibraryHeader({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      height: 150,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Book Card Widget
class BookCard extends StatelessWidget {
  final Map<String, String> book;
  final bool isFavorite;
  final bool inReadingList;
  final VoidCallback onFavoriteToggled;
  final VoidCallback onReadingToggled;

  const BookCard({
    required this.book,
    required this.isFavorite,
    required this.inReadingList,
    required this.onFavoriteToggled,
    required this.onReadingToggled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                book['imageUrl']!,
                width: 80,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 120,
                    color: Colors.grey[300],
                    child: const Icon(Icons.book),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'by ${book['author']!}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    book['category']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: onFavoriteToggled,
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: Icon(
                          inReadingList ? Icons.bookmark : Icons.bookmark_border,
                          color: inReadingList ? Colors.blue : Colors.grey,
                        ),
                        onPressed: onReadingToggled,
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile page
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, String>> books = const [
    {
      'title': 'Alamat ni Kier',
      'author': 'Dill Doe',
      'category': 'Fiction',
      'year': '2023',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsneaol5UxvkCmHRFfaBhNkyQ63IYWkm96Q6KuMuVrnXSmuhJVuRp_MuaE&s=10'
    },
    {
      'title': 'Kier the Gay',
      'author': 'Jane Smith',
      'category': 'Kabadingan',
      'year': '2024',
      'imageUrl': 'assets/images/image2.jpeg'
    },
    {
      'title': 'Kier the last human alive',
      'author': 'John Brown',
      'category': 'Sad',
      'year': '2023',
      'imageUrl': 'assets/images/image3.jpeg'
    },
    {
      'title': 'Kier ang anak sa botelyang buak',
      'author': 'Kier Marvin',
      'category': 'Romance',
      'year': '2024',
      'imageUrl': 'assets/images/image4.jpeg'
    },
    {
      'title': 'Kier ang taong nag iisa',
      'author': 'April Ayta',
      'category': 'Horror',
      'year': '2026',
      'imageUrl': 'assets/images/image5.jpeg'
    },
    {
      'title': 'Ang tinatagong lihim ni Kier',
      'author': 'Opaw sinaw',
      'category': 'Tagalog',
      'year': '2022',
      'imageUrl': 'assets/images/image6.jpeg'
    },
  ];

  final List<bool> _favoriteBooks = List<bool>.filled(6, false);
  final List<bool> _readingList = List<bool>.filled(6, false);

  @override
  Widget build(BuildContext context) {
    final favoriteBooks = books
        .asMap()
        .entries
        .where((entry) => _favoriteBooks[entry.key])
        .map((entry) => entry.value)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome To My Book Library'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 10, 13, 197),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: LibraryHeader(
              imageUrl:
                  'https://images.unsplash.com/photo-1521587760476-6c12a4b040da?auto=format&fit=crop&w=1200&q=80',
              title: 'Book Library UI',
              subtitle: 'for Students',
            ),
          ),
          // Featured section separated from list
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Featured', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 10, 13, 197))),
                      SizedBox(height: 6),
                      Text('Discover handpicked books and curated lists for you.', style: TextStyle(color: Colors.black87)),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  label: const Text('Browse Books'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 10, 13, 197),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                final isFavorite = _favoriteBooks[index];
                final inReading = _readingList[index];
                return BookCard(
                  book: book,
                  isFavorite: isFavorite,
                  inReadingList: inReading,
                  onFavoriteToggled: () => setState(() => _favoriteBooks[index] = !_favoriteBooks[index]),
                  onReadingToggled: () => setState(() => _readingList[index] = !_readingList[index]),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Favorite Books',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 13, 197),
                  ),
                ),
                const SizedBox(height: 10),
                if (favoriteBooks.isEmpty)
                  const Text(
                    'No favorite books selected yet.',
                    style: TextStyle(color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                  )
                else
                  ...favoriteBooks.map(
                    (book) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        '• ${book['title']}',
                        style: const TextStyle(color: Colors.black87,
                        fontSize: 18,),
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            favoriteBooks.isEmpty
                                ? 'Please select a favorite book first.'
                                : 'Submitted ${favoriteBooks.length} favorite book(s).',
                          ),
                          backgroundColor: const Color.fromARGB(255, 10, 13, 197),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 10, 13, 197),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}