class { 'apt':
	update => {
		frequency => 'daily',
	},
}

apt::key { 'sublimetext':
	id => '1EDDE2CDFC025D17F6DA9EC0ADAE6AD28A8F901A',
	source => 'https://download.sublimetext.com/sublimehq-pub.gpg',	
}

apt::source { 'sublime-text':
	location => 'https://download.sublimetext.com/',
	release => 'apt/dev/',
	repos => '',
	include => {
		'deb' => true,
	},
}

$packages = [
	'guake',
];

package { $packages: }

# these require apt sources
$extrapackages = [
	'sublime-text',
];

package { $extrapackages:
	require => Class['apt::update'],
}


File {
	owner => $::user,
	group => $::user,
}

Package { ensure => latest }

