Name:          swift-Octopus
Version:       %{__version}
Release:       %{!?__release:1}%{?__release}%{?dist}
Summary:       Common parts of clients of various Octopus modules

Group:         Development/Libraries
License:       MIT
URL:           https://github.com/my-mail-ru/%{name}
Source0:       https://github.com/my-mail-ru/%{name}/archive/%{version}.tar.gz#/%{name}-%{version}.tar.gz
BuildRoot:     %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

BuildRequires: swift
BuildRequires: swift-packaging
BuildRequires: libiprotocluster-devel

%swift_find_provides_and_requires

%description
This package provides common functionality which can be useful when communicating with any module of the Octopus.

%{?__revision:Built from revision %{__revision}.}


%prep
%setup -q
%swift_patch_package


%build
%swift_build


%install
rm -rf %{buildroot}
rm -f .build/release/libCOctopus.so
%swift_install
%swift_install_devel


%clean
rm -rf %{buildroot}


%files
%defattr(-,root,root,-)
%{swift_libdir}/*.so
%{swift_moduledir}/*.swiftmodule
%{swift_moduledir}/*.swiftdoc
%{swift_clangmoduleroot}/COctopus
