![Image](https://github.com/user-attachments/assets/e4b96f64-3670-42ac-87b1-c873ce516603)

Gemini Hikaye Üretici

Gemini Hikaye Üretici, kullanıcının verdiği başlangıç cümlesine dayalı olarak yapay zeka yardımıyla hikayeler oluşturan bir Flutter uygulamasıdır. Uygulama, kullanıcıya bir başlangıç metni girme imkanı verir ve ardından Google'ın Gemini API'sini kullanarak özgün bir hikaye üretir. Ayrıca, kullanıcı hikayeyi dinlemek için sesli okuma özelliğini de kullanabilir.

Özellikler

- **Başlangıç Cümlesi ile Hikaye Üretme**: Kullanıcı bir başlangıç cümlesi girer, ve uygulama, bu cümleyi kullanarak özgün bir hikaye oluşturur.
- **Sesli Okuma**: Üretilen hikaye, Flutter TTS (Text-to-Speech) kullanılarak sesli bir şekilde okunabilir. Kullanıcı, okuma sırasında duraklatma ve devam ettirme seçeneklerine sahiptir.
- **Kullanıcı Dostu Arayüz**: Kullanıcı, metin giriş alanına cümle girer, hikaye oluşturma butonuna tıklar ve hikaye metnini görebilir.
- **API Entegrasyonu**: Hikaye üretme süreci, Google Gemini API'si aracılığıyla gerçekleştirilir.

Teknolojiler

- **Flutter**: Uygulamanın geliştirilmesinde kullanılan ana çerçeve.
- **Google Gemini API**: Yapay zeka destekli hikaye üretimi için kullanılan API.
- **Flutter TTS (Text-to-Speech)**: Hikayenin sesli olarak okunmasını sağlar.
- **HTTP Paket**: API istekleri için kullanılır.

Başlangıç

Gereksinimler

- Flutter SDK (minumum Flutter 3.0)
- Bir Google Cloud API anahtarı (Gemini API için)
- Android/iOS cihaz veya emülatör

Kurulum
1. Bu depoyu klonlayın:

git clone https://github.com/[KullanıcıAdı]/gemini-hikaye-uretici.git

Gerekli bağımlılıkları yükleyin:

cd gemini-hikaye-uretici
flutter pub get
lib/main.dart dosyasındaki apiKey değişkenini kendi API anahtarınızla değiştirin.

Uygulamayı başlatın:

flutter run

Kullanım

Başlangıç Cümlesi Girin: Ana ekranda, bir başlangıç cümlesi girin.
Hikaye Oluşturun: "Hikaye Oluştur" butonuna tıklayın ve birkaç saniye içinde hikayeniz oluşturulacaktır.
Hikayeyi Dinleyin: Hikayenizi sesli olarak dinlemek için "Oku" butonuna tıklayın. Sesli okumayı durdurmak için aynı butona tekrar tıklayın.
Katkıda Bulunma
Gemini Hikaye Üretici'ye katkıda bulunmak isterseniz, aşağıdaki adımları izleyebilirsiniz:

Bu depoyu forklayın.
Yeni bir feature branch oluşturun.
Değişikliklerinizi yapın.
Değişikliklerinizi commit edin ve pushlayın.
Pull request oluşturun.

