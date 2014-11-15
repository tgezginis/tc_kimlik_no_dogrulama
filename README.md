# T.C. Kimlik No Doğrulama

Ruby için T.C. Kimlik Numarası doğrulama sistemi

## Kurulum

Gemfile dosyasınıza aşağıdaki kodu ekleyin:

```ruby
gem 'tc_kimlik_no_dogrulama'
```

ve terminalde çalıştırın:

    $ bundle

ya da gem paketini terminalden manuel olarak kurun:

    $ gem install tc_kimlik_no_dogrulama

## Kullanım

```ruby
require 'tc_kimlik_no_dogrulama'
TcKimlikNoDogrulama::verify(18071470110)
# Sonuç true ya da false dönecektir.
```

## Algoritma ve kontroller
 - T.C. Kimlik numarası 11 karakter olmalıdır.
 - T.C. Kimlik numarası 0 ile başlayamaz.
 - T.C. Kimlik numarasının tüm karakterleri sayı olmalıdır.
 - 1 3 5 7 ve 9 hanelerinin toplamının 7 katından, 2 4 6 ve 8 hanelerin toplamı çıkartıldığında, elde edilen sonucun 10’a bölümünden kalan sayı, yani Mod 10’u bize 10. haneyi vermelidir.
 - 1 2 3 4 5 6 7 8 9 ve 10 hanelerinin toplamından elde edilen sonucun 10’a bölümünden kalan sayı, yani Mod 10’u bize 11. haneyi vermelidir.
