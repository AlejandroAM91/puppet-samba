require 'spec_helper'

describe 'samba_server' do
  let(:title) { 'Samba Server' }
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('samba_server::config').with('config_manage' => true) }
      it { is_expected.to contain_class('samba_server::install').with('package_manage' => true) }
      it { is_expected.to contain_class('samba_server::service').with('service_manage' => true) }

      context 'with $config_manage => true' do
        let(:params) { {'config_manage' => true} }

        it { is_expected.to compile }
        it { is_expected.to contain_class('samba_server::config').with('config_manage' => true) }
      end

      context 'with $config_manage => false' do
        let(:params) { {'config_manage' => false} }

        it { is_expected.to compile }
        it { is_expected.to contain_class('samba_server::config').with('config_manage' => false) }
      end

      context 'with $package_manage => true' do
        let(:params) { {'package_manage' => true} }

        it { is_expected.to compile }
        it { is_expected.to contain_class('samba_server::install').with('package_manage' => true) }
      end

      context 'with $package_manage => false' do
        let(:params) { {'package_manage' => false} }

        it { is_expected.to compile }
        it { is_expected.to contain_class('samba_server::install').with('package_manage' => false) }
      end

      context 'with $service_manage => true' do
        let(:params) { {'service_manage' => true} }

        it { is_expected.to compile }
        it { is_expected.to contain_class('samba_server::service').with('service_manage' => true) }
      end

      context 'with $service_manage => false' do
        let(:params) { {'service_manage' => false} }

        it { is_expected.to compile }
        it { is_expected.to contain_class('samba_server::service').with('service_manage' => false) }
      end
    end
  end
end
