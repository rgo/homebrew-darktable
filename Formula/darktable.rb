class Darktable < Formula
  desc 'Open source photography workflow application and raw developer'
  homepage 'https://www.darktable.org'
  url 'https://github.com/darktable-org/darktable/releases/download/release-3.0.2/darktable-3.0.2.tar.xz'
  sha256 '6abaf661fe9414e92bdb33b58b98ef024ccf6132b7876abaf0751ec2109f36fb'

  depends_on 'llvm'
  depends_on 'cmake' => :build
  depends_on 'intltool' => :build
  depends_on 'jpeg'
  depends_on 'exiv2'
  depends_on 'gettext'
  depends_on 'glib'
  depends_on 'gphoto2'
  depends_on 'gtk+3'
  depends_on 'gtk-mac-integration'
  depends_on 'json-glib'
  depends_on 'lensfun'
  depends_on 'librsvg'
  depends_on 'libsecret'
  depends_on 'libsoup'
  depends_on 'little-cms2'
  depends_on 'lua'
  depends_on 'ninja'
  depends_on 'openexr'
  depends_on 'openjpeg'
  depends_on 'osm-gps-map'
  depends_on 'pugixml'
  depends_on 'graphicsmagick' => :optional

  needs :openmp

  fails_with :gcc

  resource 'raw_sample' do
    url 'https://raw.pixls.us/getfile.php/1033/nice/homebrew.raw'
    sha256 'b22f1e36331f679abb8b13e433b9bbde3988723adf10fee7aa0dda6381016a98'
  end

  def install
    mkdir 'build' do
      default_cmake_args = '-DCMAKE_OSX_DEPLOYMENT_TARGET=10.7 -DCMAKE_CXX_FLAGS=-stdlib=libc++ -DBINARY_PACKAGE_BUILD=ON -DRAWSPEED_ENABLE_LTO=ON -DBUILD_CURVE_TOOLS=ON -DBUILD_NOISE_TOOLS=ON'
      system 'cmake', '..', default_cmake_args, *std_cmake_args
      system 'make', "CC=#{ENV.clang}"
      system 'make', 'install'
    end
  end

  test do
    testpath.install resource('raw_sample')

    %w[jpg tif png exr webp j2k pfm ppm].each do |extension|
      expected_file = "image.#{extension}"
      system bin/'darktable-cli', 'homebrew.raw', '-o', expected_file
      assert File.size?(expected_file)
    end

    expected_string = 'Hello Homebrew world!'
    lua_code = <<-EOLUA.undent
      dt = require "darktable"
      dt.print("#{expected_string}")
    EOLUA

    stdout = shell_output(bin/"darktable-cli homebrew.raw -o image_lua_test.jpg --core --luacmd '#{lua_code}'")
    assert_match expected_string, stdout
  end
end

