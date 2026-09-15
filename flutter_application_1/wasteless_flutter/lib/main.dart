
import 'package:flutter/material.dart';

void main() => runApp(const WasteLessApp());

class AppColors {
  static const green = Color(0xFF4C9D78);
  static const darkGreen = Color(0xFF285D32);
  static const paleGreen = Color(0xFFEAF1E5);
  static const mint = Color(0xFFDDEBD8);
  static const cream = Color(0xFFF8F8F4);
  static const yellow = Color(0xFFF1F7A8);
  static const text = Color(0xFF315A35);
  static const muted = Color(0xFF8C988E);
}

class WasteLessApp extends StatelessWidget {
  const WasteLessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wasteless',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green),
        fontFamily: 'Arial',
      ),
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int screen = 0;
  int tab = 0;

  void go(int index) => setState(() => screen = index);

  @override
  Widget build(BuildContext context) {
    Widget body;
    switch (screen) {
      case 1:
        body = OnboardingScreen(onNext: () => go(2));
        break;
      case 2:
        body = const ExploreScreen();
        break;
      case 3:
        body = AuthScreen(isRegister: true, onBack: () => go(0), onDone: () => go(2));
        break;
      case 4:
        body = AuthScreen(isRegister: false, onBack: () => go(0), onDone: () => go(2));
        break;
      case 5:
        body = ConfirmationScreen(onHome: () => go(2));
        break;
      case 6:
        body = CheckoutScreen(onBack: () => go(2), onPay: () => go(5));
        break;
      case 7:
        body = CartScreen(onBack: () => go(2), onCheckout: () => go(6));
        break;
      case 8:
        body = ProductScreen(onBack: () => go(2), onCart: () => go(7));
        break;
      default:
        body = WelcomeScreen(
          onStart: () => go(1),
          onLogin: () => go(4),
        );
    }

    if (screen == 2) {
      return Scaffold(
        body: SafeArea(child: body),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tab,
          selectedItemColor: AppColors.darkGreen,
          unselectedItemColor: AppColors.muted,
          type: BottomNavigationBarType.fixed,
          onTap: (i) {
            setState(() {
              tab = i;
              if (i == 1) screen = 2;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Acasă'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Caută'),
            BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Salvate'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
          ],
        ),
      );
    }
    return Scaffold(body: SafeArea(child: body));
  }
}

class PageFrame extends StatelessWidget {
  final Widget child;
  final Color color;
  const PageFrame({super.key, required this.child, this.color = Colors.white});
  @override
  Widget build(BuildContext context) => Container(color: color, child: child);
}

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key, this.dark = false});
  final bool dark;
  @override
  Widget build(BuildContext context) {
    final fg = dark ? Colors.white : AppColors.darkGreen;
    return Row(
      children: [
        Container(
          width: 28, height: 28,
          decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.eco, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 9),
        Text('Wasteless', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: fg)),
      ],
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart, onLogin;
  const WelcomeScreen({super.key, required this.onStart, required this.onLogin});
  @override
  Widget build(BuildContext context) => PageFrame(
    color: AppColors.darkGreen,
    child: Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned(top: 28, left: 18, child: CircleAvatar(radius: 23, backgroundColor: Colors.white.withOpacity(.08))),
              Positioned(top: 86, left: 0, right: 0, child: Center(
                child: Container(
                  width: 64, height: 64,
                  decoration: BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
                  child: const Icon(Icons.eco, color: Colors.white, size: 34),
                ),
              )),
              Center(child: Padding(
                padding: const EdgeInsets.only(top: 125),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Wasteless', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text('Mai puțină risipă. Mai multă valoare.', style: TextStyle(color: Colors.white.withOpacity(.78), fontSize: 13)),
                    Text('Mai bine pentru comunitatea ta.', style: TextStyle(color: Colors.white.withOpacity(.78), fontSize: 13)),
                  ],
                ),
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              SizedBox(width: double.infinity, child: ElevatedButton(
                onPressed: onStart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yellow, foregroundColor: AppColors.darkGreen,
                  padding: const EdgeInsets.symmetric(vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Începe acum', style: TextStyle(fontWeight: FontWeight.w800)),
              )),
              const SizedBox(height: 7),
              SizedBox(width: double.infinity, child: OutlinedButton(
                onPressed: onLogin,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white, side: BorderSide(color: Colors.white.withOpacity(.14)),
                  backgroundColor: Colors.white.withOpacity(.08), padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Autentifică-te'),
              )),
              const SizedBox(height: 50),
              Text('Continuând, ești de acord cu Termenii și Politica de Confidențialitate.',
                textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(.35), fontSize: 8)),
            ],
          ),
        ),
      ],
    ),
  );
}

class OnboardingScreen extends StatelessWidget {
  final VoidCallback onNext;
  const OnboardingScreen({super.key, required this.onNext});
  @override
  Widget build(BuildContext context) => PageFrame(
    child: Column(
      children: [
        Align(alignment: Alignment.topRight, child: Padding(
          padding: const EdgeInsets.all(16),
          child: Chip(label: const Text('Sari peste', style: TextStyle(fontSize: 9)), backgroundColor: AppColors.paleGreen),
        )),
        Expanded(child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: 190, height: 190,
            decoration: BoxDecoration(color: AppColors.paleGreen, borderRadius: BorderRadius.circular(28)),
            child: Center(child: Container(
              width: 138, height: 138,
              decoration: BoxDecoration(color: AppColors.mint, borderRadius: BorderRadius.circular(22)),
              child: const Icon(Icons.check_circle, color: AppColors.green, size: 42),
            )),
          ),
          const SizedBox(height: 42),
          const Text('Salvează mâncare,\nun deal pe zi', textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, height: 1.15, fontWeight: FontWeight.w800, color: AppColors.darkGreen)),
          const SizedBox(height: 14),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text('Descoperă produse cu discount înainte de expirare de la magazine, brutării și restaurante locale — salvează-le înainte să fie aruncate.',
              textAlign: TextAlign.center, style: TextStyle(color: AppColors.muted, fontSize: 11, height: 1.4)),
          ),
        ]))),
        Padding(
          padding: const EdgeInsets.all(18),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(width: 13, height: 4, decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(4))),
              const SizedBox(width: 6), const Dot(), const SizedBox(width: 6), const Dot(),
            ]),
            const SizedBox(height: 30),
            SizedBox(width: double.infinity, child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              child: const Text('Înainte  →', style: TextStyle(fontWeight: FontWeight.w700)),
            )),
          ]),
        )
      ],
    ),
  );
}

class Dot extends StatelessWidget {
  const Dot({super.key});
  @override
  Widget build(BuildContext context) => Container(width: 5, height: 5, decoration: const BoxDecoration(color: Color(0xFFD4D8D2), shape: BoxShape.circle));
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final products = [
      ('Spanac proaspăt', '1,20 lei', Icons.eco, AppColors.paleGreen, '-60%'),
      ('Croissant cu unt', '2,00 lei', Icons.bakery_dining, const Color(0xFFFFE7B1), '-50%'),
      ('Mere Ionatan 1kg', '3,25 lei', Icons.apple, const Color(0xFFFFE2E2), '-35%'),
      ('Platou sushi mix', '22,00 lei', Icons.ramen_dining, const Color(0xFFE9D8F7), '-45%'),
      ('Lapte grecesc (500g)', '1,20 lei', Icons.water_drop, const Color(0xFFDCECF5), '-40%'),
      ('Salată fresh', '6,50 lei', Icons.local_florist, const Color(0xFFFFDCC7), '-30%'),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Caută oferte 🔍', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.darkGreen)),
          Container(width: 30, height: 30, decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.tune, color: Colors.white, size: 17)),
        ]),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: 'Caută produse, magazine...',
            hintStyle: const TextStyle(fontSize: 10, color: AppColors.muted),
            prefixIcon: const Icon(Icons.search, size: 17),
            filled: true, fillColor: AppColors.cream,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            contentPadding: EdgeInsets.zero,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: [
          _Filter('Toate', true), _Filter('Legume', false), _Filter('Brutărie', false), _Filter('Lactate', false),
        ])),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('118 oferte găsite', style: TextStyle(fontSize: 9, color: AppColors.muted)),
          const Text('☰ Sortare', style: TextStyle(fontSize: 9, color: AppColors.green, fontWeight: FontWeight.w700)),
        ]),
        const SizedBox(height: 8),
        Expanded(child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 18),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: .82),
          itemCount: products.length,
          itemBuilder: (_, i) {
            final p = products[i];
            return ProductCard(name: p.$1, price: p.$2, icon: p.$3, bg: p.$4, badge: p.$5);
          },
        )),
      ]),
    );
  }
}

class _Filter extends StatelessWidget {
  final String text; final bool selected;
  const _Filter(this.text, this.selected);
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(right: 6),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
    decoration: BoxDecoration(color: selected ? AppColors.darkGreen : AppColors.cream, borderRadius: BorderRadius.circular(20)),
    child: Text(text, style: TextStyle(fontSize: 9, color: selected ? Colors.white : AppColors.darkGreen, fontWeight: FontWeight.w700)),
  );
}

class ProductCard extends StatelessWidget {
  final String name, price, badge; final IconData icon; final Color bg;
  const ProductCard({super.key, required this.name, required this.price, required this.icon, required this.bg, required this.badge});
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFECEEEA))),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(child: Container(
        width: double.infinity, decoration: BoxDecoration(color: bg, borderRadius: const BorderRadius.vertical(top: Radius.circular(10))),
        child: Stack(children: [
          Center(child: Icon(icon, size: 52, color: AppColors.green.withOpacity(.8))),
          Positioned(top: 7, left: 7, child: Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(color: AppColors.darkGreen, borderRadius: BorderRadius.circular(5)),
            child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w800)))),
        ]),
      )),
      Padding(padding: const EdgeInsets.fromLTRB(9, 8, 7, 8), child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.darkGreen)),
          const SizedBox(height: 3), Text(price, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.green)),
        ])),
        Container(width: 23, height: 23, decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
          child: const Icon(Icons.add, color: Colors.white, size: 15)),
      ])),
    ]),
  );
}

class AuthScreen extends StatelessWidget {
  final bool isRegister; final VoidCallback onBack, onDone;
  const AuthScreen({super.key, required this.isRegister, required this.onBack, required this.onDone});
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 25),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(height: 82, width: double.infinity, padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: AppColors.darkGreen, borderRadius: BorderRadius.vertical(bottom: Radius.circular(18))),
        child: const BrandHeader(dark: true)),
      const SizedBox(height: 24),
      Text(isRegister ? 'Înregistrare' : 'Autentificare', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.darkGreen)),
      const SizedBox(height: 20),
      if (isRegister) ...[
        const _Field(label: 'Numele tău complet', hint: 'Simone Marton'),
        const _Field(label: 'Adresă de email', hint: 'simone@email.com'),
        const _Field(label: 'Număr de telefon', hint: '+40   7xx xxx xxx'),
      ] else
        const _Field(label: 'Adresă de email', hint: 'email@exemplu.ro'),
      const _Field(label: 'Parolă', hint: '••••••••••', obscure: true),
      if (isRegister) ...[
        const SizedBox(height: 8),
        Row(children: [
          const Icon(Icons.check_box, color: AppColors.green, size: 17),
          const SizedBox(width: 6),
          Expanded(child: Text('Sunt de acord cu Termenii și condițiile și Politica de confidențialitate',
            style: TextStyle(fontSize: 8, color: Colors.grey.shade600))),
        ]),
      ] else Align(alignment: Alignment.centerRight, child: Text('Ai uitat parola?', style: TextStyle(fontSize: 9, color: AppColors.green, fontWeight: FontWeight.w700))),
      const SizedBox(height: 14),
      SizedBox(width: double.infinity, child: ElevatedButton(
        onPressed: onDone,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        child: Text(isRegister ? 'Creează cont' : 'Autentifică-te', style: const TextStyle(fontWeight: FontWeight.w800)),
      )),
      const SizedBox(height: 12),
      Row(children: [const Expanded(child: Divider()), Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text('sau continuă cu', style: TextStyle(fontSize: 8, color: AppColors.muted))), const Expanded(child: Divider())]),
      const SizedBox(height: 12),
      Row(children: [
        Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.g_mobiledata, size: 18), label: const Text('Google', style: TextStyle(fontSize: 9)))),
        const SizedBox(width: 8),
        Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.apple, size: 17), label: const Text('Apple', style: TextStyle(fontSize: 9)))),
      ]),
      const SizedBox(height: 18),
      Center(child: TextButton(onPressed: onBack, child: const Text('← Înapoi', style: TextStyle(fontSize: 10, color: AppColors.darkGreen)))),
    ]),
  );
}

class _Field extends StatelessWidget {
  final String label, hint; final bool obscure;
  const _Field({required this.label, required this.hint, this.obscure = false});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(fontSize: 9, color: AppColors.darkGreen, fontWeight: FontWeight.w700)),
      const SizedBox(height: 5),
      TextField(obscureText: obscure, decoration: InputDecoration(
        hintText: hint, hintStyle: const TextStyle(fontSize: 9, color: Color(0xFFADB4AE)),
        filled: true, fillColor: Colors.white, contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: Color(0xFFDCE3DC))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: AppColors.green)),
      )),
    ]),
  );
}

class ConfirmationScreen extends StatelessWidget {
  final VoidCallback onHome;
  const ConfirmationScreen({super.key, required this.onHome});
  @override
  Widget build(BuildContext context) => Center(child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(width: 82, height: 82, decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(24)),
        child: const Icon(Icons.check, color: Colors.white, size: 44)),
      const SizedBox(height: 25),
      const Text('Comandă confirmată! 🎉', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: AppColors.darkGreen)),
      const SizedBox(height: 7),
      const Text('Mulțumim că ai salvat mâncare! Comanda ta este pregătită pentru ridicare.', textAlign: TextAlign.center,
        style: TextStyle(fontSize: 10, color: AppColors.muted)),
      const SizedBox(height: 22),
      _OrderSummary(),
      const SizedBox(height: 10),
      Container(width: double.infinity, padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppColors.darkGreen, borderRadius: BorderRadius.circular(10)),
        child: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Impactul acestei comenzi', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
          Text('1,8 kg   •   9,90 lei', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800)),
        ])),
      const SizedBox(height: 12),
      SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onHome,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
        child: const Text('Înapoi la pagina principală'))),
    ]),
  ));
}

class _OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity, padding: const EdgeInsets.all(13),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13), boxShadow: const [BoxShadow(blurRadius: 16, color: Color(0x10000000))]),
    child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Comanda #1043', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: AppColors.darkGreen)), Text('De ridicat', style: TextStyle(fontSize: 8, color: AppColors.green, fontWeight: FontWeight.w700))]),
      const Divider(height: 16),
      const _Line(icon: Icons.eco, text: 'Bol de salată proaspătă', price: '3,40 lei'),
      const _Line(icon: Icons.bakery_dining, text: 'Pâine sourdough x2', price: '5,60 lei'),
      const _Line(icon: Icons.water_drop, text: 'Iaurt grecesc 500g', price: '1,20 lei'),
      const Divider(height: 14),
      const Row(children: [Icon(Icons.location_on_outlined, size: 13, color: AppColors.muted), SizedBox(width: 5), Text('Piața Verde, Str. Florilor 14', style: TextStyle(fontSize: 8, color: AppColors.muted))]),
      const SizedBox(height: 6),
      const Row(children: [Icon(Icons.access_time, size: 13, color: AppColors.muted), SizedBox(width: 5), Text('Ridică până la 20:00 azi', style: TextStyle(fontSize: 8, color: AppColors.muted))]),
    ]),
  );
}

class _Line extends StatelessWidget {
  final IconData icon; final String text, price;
  const _Line({required this.icon, required this.text, required this.price});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: Row(children: [
    Icon(icon, size: 14, color: AppColors.green), const SizedBox(width: 7),
    Expanded(child: Text(text, style: const TextStyle(fontSize: 9, color: AppColors.darkGreen))),
    Text(price, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: AppColors.darkGreen)),
  ]));
}

class CheckoutScreen extends StatelessWidget {
  final VoidCallback onBack, onPay;
  const CheckoutScreen({super.key, required this.onBack, required this.onPay});
  @override
  Widget build(BuildContext context) => SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    _TopBar(title: 'Finalizează comandă', onBack: onBack),
    const SizedBox(height: 18),
    const _SectionCard(title: 'Sumar comandă', child: Column(children: [
      _Line(icon: Icons.eco, text: 'Bol de salată x1', price: '3,40 lei'),
      _Line(icon: Icons.bakery_dining, text: 'Pâine sourdough x2', price: '5,60 lei'),
      _Line(icon: Icons.water_drop, text: 'Iaurt grecesc x1', price: '1,20 lei'),
      Divider(),
      _Totals(),
    ])),
    const SizedBox(height: 15),
    const _SectionCard(title: 'Locație ridicare', child: ListTile(
      contentPadding: EdgeInsets.zero, leading: CircleAvatar(backgroundColor: AppColors.paleGreen, child: Icon(Icons.eco, color: AppColors.green)),
      title: Text('Piața Verde', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.darkGreen)),
      subtitle: Text('Str. Florilor 14, Cluj-Napoca\nRidicare azi: 10:00 - 20:00', style: TextStyle(fontSize: 8)),
      trailing: Icon(Icons.chevron_right, size: 18),
    )),
    const SizedBox(height: 15),
    const _SectionCard(title: 'Metodă de plată', child: Card(
      margin: EdgeInsets.zero, color: AppColors.darkGreen, child: Padding(padding: EdgeInsets.all(14), child: Row(children: [
        Text('VISA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        SizedBox(width: 12), Expanded(child: Text('•••• •••• •••• 4219\nValabil până la 08/27', style: TextStyle(color: Colors.white, fontSize: 8))),
        Icon(Icons.radio_button_checked, color: AppColors.yellow, size: 18),
      ])))),
    const SizedBox(height: 20),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
      Text('Total de plată', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.darkGreen)),
      Text('10,70 lei', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: AppColors.darkGreen)),
    ]),
    const SizedBox(height: 10),
    SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: onPay, icon: const Icon(Icons.lock_outline, size: 16),
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkGreen, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
      label: const Text('Plătește acum'))),
  ]));
}

class _Totals extends StatelessWidget {
  const _Totals();
  @override
  Widget build(BuildContext context) => const Column(children: [
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Subtotal', style: TextStyle(fontSize: 8)), Text('10,20 lei', style: TextStyle(fontSize: 8))]),
    SizedBox(height: 4),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Taxa serviciu', style: TextStyle(fontSize: 8)), Text('0,50 lei', style: TextStyle(fontSize: 8))]),
  ]);
}

class _SectionCard extends StatelessWidget {
  final String title; final Widget child;
  const _SectionCard({required this.title, required this.child});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.darkGreen)),
    const SizedBox(height: 7),
    Container(width: double.infinity, padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE7EBE5))),
      child: child),
  ]);
}

class CartScreen extends StatelessWidget {
  final VoidCallback onBack, onCheckout;
  const CartScreen({super.key, required this.onBack, required this.onCheckout});
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.all(16), child: Column(children: [
    _TopBar(title: 'Coșul meu', onBack: onBack, trailing: '4 produse'),
    const SizedBox(height: 15),
    const _CartItem(icon: Icons.eco, name: 'Bol de salată proaspătă', price: '3,40 lei', qty: 1),
    const _CartItem(icon: Icons.bakery_dining, name: 'Pâine sourdough', price: '2,80 lei', qty: 2),
    const _CartItem(icon: Icons.water_drop, name: 'Iaurt grecesc (500g)', price: '1,20 lei', qty: 1),
    const Spacer(),
    Container(width: double.infinity, padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.darkGreen, borderRadius: BorderRadius.circular(12)),
      child: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Impactul tău pozitiv\n1,8 kg   •   4 produse', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
        Text('9,90 lei', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900)),
      ])),
    const SizedBox(height: 10),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
      Text('Total', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.darkGreen)),
      Text('10,70 lei', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: AppColors.darkGreen)),
    ]),
    const SizedBox(height: 10),
    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onCheckout,
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkGreen, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
      child: const Text('Finalizează · 10,70 lei →'))),
  ]));
}

class _CartItem extends StatelessWidget {
  final IconData icon; final String name, price; final int qty;
  const _CartItem({required this.icon, required this.name, required this.price, required this.qty});
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.all(9),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11), border: Border.all(color: const Color(0xFFE9EDE8))),
    child: Row(children: [
      Container(width: 38, height: 38, decoration: BoxDecoration(color: AppColors.paleGreen, borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: AppColors.green)),
      const SizedBox(width: 9), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(name, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: AppColors.darkGreen)),
        const SizedBox(height: 3), Text(price, style: const TextStyle(fontSize: 9, color: AppColors.green, fontWeight: FontWeight.w700)),
      ])),
      _QtyButton(icon: Icons.remove), Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text('$qty', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800))),
      _QtyButton(icon: Icons.add),
    ]),
  );
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  const _QtyButton({required this.icon});
  @override
  Widget build(BuildContext context) => Container(width: 24, height: 24, decoration: BoxDecoration(color: AppColors.cream, borderRadius: BorderRadius.circular(7)), child: Icon(icon, size: 14, color: AppColors.darkGreen));
}

class ProductScreen extends StatelessWidget {
  final VoidCallback onBack, onCart;
  const ProductScreen({super.key, required this.onBack, required this.onCart});
  @override
  Widget build(BuildContext context) => SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Stack(children: [
      Container(height: 260, color: AppColors.paleGreen, child: Center(child: Container(width: 180, height: 130,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(70)), child: const Icon(Icons.eco, size: 72, color: AppColors.green)))),
      Positioned(top: 15, left: 15, child: CircleAvatar(backgroundColor: Colors.white, child: IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back_ios_new, size: 16)))),
      Positioned(top: 15, right: 15, child: CircleAvatar(backgroundColor: Colors.white, child: const Icon(Icons.bookmark_border, size: 18))),
    ]),
    Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        const Icon(Icons.location_on, size: 13, color: AppColors.green),
        const SizedBox(width: 4), const Text('Piața Verde · 0,4 km', style: TextStyle(fontSize: 9, color: AppColors.muted)),
        const Spacer(), const Icon(Icons.star, size: 13, color: AppColors.green), const Text(' 4.8', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700)),
      ]),
      const SizedBox(height: 10),
      const Text('Bol de salată proaspătă', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: AppColors.darkGreen)),
      const SizedBox(height: 8),
      const Text('Verdețuri de sezon, roșii cherry, castraveți și vinegretă de casă. Preparat dimineață — salvat împotriva risipei.', style: TextStyle(fontSize: 10, height: 1.4, color: AppColors.muted)),
      const SizedBox(height: 12),
      Wrap(spacing: 6, children: const [
        Chip(label: Text('Vegan', style: TextStyle(fontSize: 8))), Chip(label: Text('Fără gluten', style: TextStyle(fontSize: 8))), Chip(label: Text('400 kcal', style: TextStyle(fontSize: 8))),
      ]),
      const SizedBox(height: 14),
      const Text('Cantitate', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.darkGreen)),
      const SizedBox(height: 8),
      Row(children: [
        Container(width: 32, height: 32, decoration: BoxDecoration(color: AppColors.cream, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.remove, size: 16)),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 15), child: Text('1', style: TextStyle(fontWeight: FontWeight.w800))),
        Container(width: 32, height: 32, decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.add, size: 16, color: Colors.white)),
      ]),
      const SizedBox(height: 15),
      Container(padding: const EdgeInsets.all(11), decoration: BoxDecoration(color: AppColors.paleGreen, borderRadius: BorderRadius.circular(10)),
        child: Row(children: const [Icon(Icons.eco, color: AppColors.green, size: 17), SizedBox(width: 7), Expanded(child: Text('Prin salvarea acestui produs economisești aproximativ 0,4 kg CO₂.', style: TextStyle(fontSize: 8, color: AppColors.darkGreen)))])),
      const SizedBox(height: 14),
      Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        const Text('3,40 lei', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: AppColors.darkGreen)),
        const SizedBox(width: 7), const Text('−60%', style: TextStyle(fontSize: 9, color: AppColors.green, fontWeight: FontWeight.w800)),
        const Spacer(),
      ]),
      const SizedBox(height: 9),
      SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: onCart, icon: const Icon(Icons.shopping_cart_outlined, size: 16),
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
        label: const Text('Adaugă în coș'))),
    ])),
  ]));
}

class _TopBar extends StatelessWidget {
  final String title; final VoidCallback onBack; final String? trailing;
  const _TopBar({required this.title, required this.onBack, this.trailing});
  @override
  Widget build(BuildContext context) => Row(children: [
    IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back_ios_new, size: 16)),
    Expanded(child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.darkGreen))),
    if (trailing != null) Text(trailing!, style: const TextStyle(fontSize: 8, color: AppColors.muted)),
  ]);
}
