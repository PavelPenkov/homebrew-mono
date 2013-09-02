require 'formula'

class Mono < Formula
  homepage 'http://http://www.mono-project.com/'
  url 'http://download.mono-project.com/sources/mono/mono-3.2.1.tar.bz2'
  sha1 '7f4f31e03903719e370e7ee94ded376b96bdf6d9'
  head 'git://github.com/mono/mono.git'

  #depends_on :x11 # if your formula requires any X11/XQuartz components

  if build.head?
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  def install
    args = ["--prefix=#{prefix}", "--with-glib=embedded", "--enable-nls=no"]
    args << "--host=x86_64-apple-darwin10" if MacOS.prefer_64_bit?

    system "./configure", *args
    system "make"
    system "make install"
  end

  test do
    system "mono"
  end
end
