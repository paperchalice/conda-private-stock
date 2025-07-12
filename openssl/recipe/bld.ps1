$opts = @(
    'VC-WIN64A',
    "--prefix=$LIBRARY_PREFIX",
    "--openssldir=SSL",
    '--release',
    'enable-brotli',
    'enable-zlib',
    'enable-zstd',
    '--with-zlib-lib=z.lib',
    '--with-zstd-lib=zstd.lib'
    'no-legacy',
    'no-tls-deprecated-ec',
    'no-deprecated',
    'shared'
)
$Env:CFLAGS += ' /O1'
$Env:CXXFLAGS += ' /O1'
$Env:LDFLAGS += ' /DEBUG'
perl .\Configure @opts
NO
nmake
nmake install

Remove-Item $LIBRARY_BIN\*.pdb
New-Item $LIBRARY_LIB\pkgconfig -ItemType Directory
Copy-Item exporters\*.pc -Destination $LIBRARY_LIB\pkgconfig
