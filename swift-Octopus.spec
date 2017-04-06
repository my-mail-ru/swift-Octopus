Name:          swift-Octopus
Version:       %{__version}
Release:       %{!?__release:1}%{?__release}%{?dist}
Summary:       Common parts of clients of various Octopus modules

Group:         Development/Libraries
License:       MIT
URL:           https://github.com/my-mail-ru/%{name}
Source0:       https://github.com/my-mail-ru/%{name}/archive/%{version}.tar.gz#/%{name}-%{version}.tar.gz
BuildRoot:     %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

BuildRequires: swift >= 3.0.2
BuildRequires: swift-packaging >= 0.6
BuildRequires: swiftpm(https://github.com/my-mail-ru/swift-CIProto.git) >= 0.2.0

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
%swift_install
%swift_install_devel


%clean
rm -rf %{buildroot}


%files
%defattr(-,root,root,-)
%{swift_libdir}/*.so


%package devel
Summary:  Common parts of clients of various Octopus modules
Requires: %{name} = %{version}-%{release}
Requires: libiprotocluster-devel

%description devel
This package provides common functionality which can be useful when communicating with any module of the Octopus.

%{?__revision:Built from revision %{__revision}.}


%files devel
%defattr(-,root,root,-)
%{swift_moduledir}/*.swiftmodule
%{swift_moduledir}/*.swiftdoc
