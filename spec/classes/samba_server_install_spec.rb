require 'spec_helper'

describe 'samba_server::install' do
  let(:title) { 'Samba Server Install' }

  shared_examples 'common' do
    it { is_expected.to compile }
  end

  shared_examples 'package_samba' do
    include_examples 'common'
    it {
      is_expected.to contain_package('samba')
        .with('ensure' => 'present')
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      include_examples 'package_samba'

      context 'with $package_manage => true' do
        let(:params) { { 'package_manage' => true } }

        include_examples 'package_samba'
      end

      context 'with $package_manage => false' do
        let(:params) { { 'package_manage' => false } }

        include_examples 'common'
        it { is_expected.not_to contain_package('samba') }
      end
    end
  end
end
