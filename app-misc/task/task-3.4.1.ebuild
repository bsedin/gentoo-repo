# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler2@2.0.0
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.21
	anyhow@1.0.97
	async-stream-impl@0.3.6
	async-stream@0.3.6
	async-trait@0.1.87
	atomic-waker@1.1.2
	autocfg@1.4.0
	aws-config@1.6.0
	aws-credential-types@1.2.2
	aws-lc-rs@1.12.6
	aws-lc-sys@0.27.0
	aws-runtime@1.5.6
	aws-sdk-s3@1.79.0
	aws-sdk-sso@1.62.0
	aws-sdk-ssooidc@1.63.0
	aws-sdk-sts@1.63.0
	aws-sigv4@1.3.0
	aws-smithy-async@1.2.5
	aws-smithy-checksums@0.63.1
	aws-smithy-eventstream@0.60.8
	aws-smithy-http-client@1.0.0
	aws-smithy-http@0.62.0
	aws-smithy-json@0.61.3
	aws-smithy-query@0.60.7
	aws-smithy-runtime-api@1.7.4
	aws-smithy-runtime@1.8.0
	aws-smithy-types@1.3.0
	aws-smithy-xml@0.60.9
	aws-types@1.3.6
	base16ct@0.1.1
	base64-simd@0.8.0
	base64@0.21.7
	base64@0.22.1
	base64ct@1.7.1
	bitflags@2.9.0
	block-buffer@0.10.4
	byteorder@1.5.0
	bytes-utils@0.1.4
	bytes@1.10.1
	cc@1.2.16
	cfg-if@1.0.0
	chrono@0.4.40
	cmake@0.1.54
	codespan-reporting@0.11.1
	const-oid@0.9.6
	cpufeatures@0.2.17
	crc-catalog@2.4.0
	crc32c@0.6.8
	crc32fast@1.4.2
	crc64fast-nvme@1.2.0
	crc@3.2.1
	crypto-bigint@0.4.9
	crypto-bigint@0.5.5
	crypto-common@0.1.6
	cxx-build@1.0.144
	cxx@1.0.144
	cxxbridge-cmd@1.0.144
	cxxbridge-flags@1.0.144
	cxxbridge-macro@1.0.144
	der@0.6.1
	der@0.7.9
	deranged@0.3.11
	digest@0.10.7
	displaydoc@0.2.5
	dunce@1.0.5
	ecdsa@0.14.8
	either@1.15.0
	elliptic-curve@0.12.3
	encoding_rs@0.8.35
	equivalent@1.0.2
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	fastrand@2.3.0
	ff@0.12.1
	flate2@1.1.0
	fnv@1.0.7
	foldhash@0.1.4
	form_urlencoded@1.2.1
	fs_extra@1.3.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	generic-array@0.14.7
	getrandom@0.2.15
	getrandom@0.3.1
	google-cloud-auth@0.17.2
	google-cloud-metadata@0.5.1
	google-cloud-storage@0.23.0
	google-cloud-token@0.1.2
	group@0.12.1
	h2@0.3.26
	h2@0.4.8
	hashbrown@0.14.5
	hashbrown@0.15.2
	hashlink@0.9.1
	heck@0.5.0
	hex@0.4.3
	hmac@0.12.1
	home@0.5.11
	http-body-util@0.1.3
	http-body@0.4.6
	http-body@1.0.1
	http@0.2.12
	http@1.3.1
	httparse@1.10.1
	httpdate@1.0.3
	hyper-rustls@0.24.2
	hyper-rustls@0.27.5
	hyper-util@0.1.10
	hyper@0.14.32
	hyper@1.6.0
	iana-time-zone@0.1.61
	icu_collections@1.5.0
	icu_locid@1.5.0
	icu_locid_transform@1.5.0
	icu_locid_transform_data@1.5.0
	icu_normalizer@1.5.0
	icu_normalizer_data@1.5.0
	icu_properties@1.5.1
	icu_properties_data@1.5.0
	icu_provider@1.5.0
	icu_provider_macros@1.5.0
	idna@1.0.3
	idna_adapter@1.2.0
	indexmap@2.8.0
	ipnet@2.11.0
	itoa@1.0.15
	jobserver@0.1.32
	jsonwebtoken@9.3.1
	libc@0.2.171
	libsqlite3-sys@0.30.1
	link-cplusplus@1.0.10
	litemap@0.7.5
	lock_api@0.4.12
	log@0.4.26
	lru@0.12.5
	md-5@0.10.6
	memchr@2.7.4
	mime@0.3.17
	mime_guess@2.0.5
	miniz_oxide@0.8.5
	mio@1.0.3
	num-bigint@0.4.6
	num-conv@0.1.0
	num-integer@0.1.46
	num-traits@0.2.19
	once_cell@1.21.0
	openssl-probe@0.1.6
	outref@0.5.2
	p256@0.11.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	pem-rfc7468@0.7.0
	pem@3.0.5
	percent-encoding@2.3.1
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	pkcs8@0.10.2
	pkcs8@0.9.0
	pkg-config@0.3.32
	powerfmt@0.2.0
	proc-macro2@1.0.94
	quote@1.0.40
	rand_core@0.6.4
	regex-automata@0.4.9
	regex-lite@0.1.6
	regex-syntax@0.8.5
	regex@1.11.1
	reqwest-middleware@0.4.1
	reqwest@0.12.14
	rfc6979@0.3.1
	ring@0.17.14
	rusqlite@0.32.1
	rustc_version@0.4.1
	rustls-native-certs@0.6.3
	rustls-native-certs@0.8.1
	rustls-pemfile@1.0.4
	rustls-pemfile@2.2.0
	rustls-pki-types@1.11.0
	rustls-webpki@0.101.7
	rustls-webpki@0.102.8
	rustls@0.21.12
	rustls@0.23.23
	rustversion@1.0.20
	ryu@1.0.20
	scopeguard@1.2.0
	scratch@1.0.8
	sct@0.7.1
	sec1@0.3.0
	semver@1.0.26
	serde@1.0.219
	serde_derive@1.0.219
	serde_json@1.0.140
	serde_urlencoded@0.7.1
	sha1@0.10.6
	sha2@0.10.8
	shlex@1.3.0
	signal-hook-registry@1.4.2
	signature@1.6.4
	simple_asn1@0.6.3
	slab@0.4.9
	smallvec@1.14.0
	socket2@0.5.8
	spki@0.6.0
	spki@0.7.3
	stable_deref_trait@1.2.0
	strum@0.26.3
	strum_macros@0.26.4
	subtle@2.6.1
	syn@2.0.100
	sync_wrapper@1.0.2
	synstructure@0.13.1
	taskchampion@2.0.2
	termcolor@1.4.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.12
	thiserror@1.0.69
	thiserror@2.0.12
	time-core@0.1.3
	time-macros@0.2.20
	time@0.3.39
	tinystr@0.7.6
	tokio-macros@2.5.0
	tokio-rustls@0.24.1
	tokio-rustls@0.26.2
	tokio-util@0.7.13
	tokio@1.44.0
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.5.2
	tracing-attributes@0.1.28
	tracing-core@0.1.33
	tracing@0.1.41
	try-lock@0.2.5
	typenum@1.18.0
	unicase@2.8.1
	unicode-ident@1.0.18
	unicode-width@0.1.14
	untrusted@0.9.0
	ureq@2.12.1
	url@2.5.4
	urlencoding@2.1.3
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	uuid@1.15.1
	vcpkg@0.2.15
	version_check@0.9.5
	vsimd@0.8.0
	want@0.3.1
	webpki-roots@0.26.8
	write16@1.0.0
	writeable@0.5.5
	xmlparser@0.13.6
	yoke-derive@0.7.5
	yoke@0.7.5
	zerocopy@0.7.35
	zerofrom-derive@0.1.6
	zerofrom@0.1.6
	zeroize@1.8.1
	zerovec-derive@0.10.3
	zerovec@0.10.4
"
RUST_MIN_VER="1.81.0"

CMAKE_MAKEFILE_GENERATOR="emake"
inherit bash-completion-r1 cargo cmake

DESCRIPTION="Taskwarrior is a command-line todo list manager"
HOMEPAGE="https://taskwarrior.org/"
SRC_URI="
	https://github.com/GothenburgBitFactory/taskwarrior/releases/download/v${PV}/${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD ISC MIT MPL-2.0 Unicode-3.0 Unicode-DFS-2016 ZLIB
"

SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~x64-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare

	# don't automatically install scripts
	sed -i '/scripts/d' CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_TLS_NATIVE_ROOTS=ON
		-DTASK_DOCDIR="share/doc/${PF}"
		-DTASK_RCDIR="share/${PN}/rc"
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	newbashcomp scripts/bash/task.sh task

	# fish-completions
	insinto /usr/share/fish/vendor_completions.d
	doins scripts/fish/*

	# vim syntax
	rm scripts/vim/README || die "Unable to remove README from Vim files"
	insinto /usr/share/vim/vimfiles
	doins -r scripts/vim/*

	# zsh-completions
	insinto /usr/share/zsh/site-functions
	doins scripts/zsh/*
}

pkg_preinst() {
        has_version "<${CATEGORY}/${PN}-3"
        is_previous_version_less_than_3=$?
}

pkg_postinst() {
        if [[ ${is_previous_version_less_than_3} == 0 ]] ; then
                ewarn "Taskwarrior 3 has changed its task storage."
                ewarn "Upgrading from version 2 requires manual action."
                ewarn
                ewarn "The following command imports data from Taskwarrior 2"
                ewarn "and disables all hooks during import:"
                ewarn
                ewarn "task import-v2 rc.hooks=0"
                ewarn
                ewarn "Taskwarrior 2 .data files can be backed up or removed."
                ewarn "Refer to https://taskwarrior.org/docs/upgrade-3/ for details."
        fi
}
