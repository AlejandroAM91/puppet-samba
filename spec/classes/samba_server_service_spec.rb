require 'spec_helper'

describe 'samba_server::service' do
  let(:title) { 'Samba Server Service' }
  let(:pre_condition) do
    [
      'include samba_server::config',
      'include samba_server::install',
    ]
  end

  shared_examples 'common' do
    it { is_expected.to compile.with_all_deps }
  end

  shared_examples 'service_samba' do
    include_examples 'common'

    it {
      is_expected.to contain_service('smbd')
        .that_requires('Class[samba_server::config]')
    }

    it {
      is_expected.to contain_service('smbd')
        .with(
          'ensure' => 'running',
          'enable' => true,
        )
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      include_examples 'service_samba'

      context 'with $service_manage => true' do
        let(:params) { { 'service_manage' => true } }

        include_examples 'service_samba'
      end

      context 'with $service_manage => false' do
        let(:params) { { 'service_manage' => false } }

        include_examples 'common'
        it { is_expected.not_to contain_service('smbd') }
      end
    end
  end
end
