require 'spec_helper'

describe 'samba_server::config' do
  let(:title) { 'Samba Server Config' }
  let(:pre_condition) { [
    'include samba_server::install',
    'include samba_server::service',
  ] }

  shared_examples 'common' do
    it { is_expected.to compile.with_all_deps }
  end
  
  shared_examples 'config_samba' do |content|
    include_examples 'common'

    it {
      is_expected.to contain_file('/etc/samba/smb.conf')
        .that_requires('Class[samba_server::install]')
    }

    it {
      is_expected.to contain_file('/etc/samba/smb.conf')
        .that_notifies('Class[samba_server::service]')
    }

    it {
      is_expected.to contain_file('/etc/samba/smb.conf')
        .with(
          'ensure' => 'present'
        )
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      
      include_examples 'config_samba'

      context 'with $config_manage => true' do
        let(:params) { {'config_manage' => true} }

        include_examples 'config_samba'

        context 'and with defined shared resource' do
          let(:params) { {'share_definitions' => [{
            'name' => 'test',
            'path' => '/dir/test',
          }]} }
  
          include_examples 'config_samba'

          it {
            is_expected.to contain_file('/dir/test')
              .with(
                'ensure' => 'directory',
                'mode' => '1777'
              )
          }
        end
      end

      context 'with $config_manage => false' do
        let(:params) { {'config_manage' => false} }

        include_examples "common"
        it { is_expected.not_to contain_file('/etc/samba/smb.conf') }
      end
    end
  end
end
