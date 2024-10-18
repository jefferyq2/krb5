require 'spec_helper'

describe 'krb5::kadmin_init' do
  context 'on Centos 6.7 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.7) do |node|
        node.automatic['domain'] = 'example.com'
        stub_command('test -e /var/kerberos/krb5kdc/principal').and_return(false)
        stub_command("kadmin.local -q 'list_principals' | grep -e ^admin/admin").and_return(false)
      end.converge(described_recipe)
    end

    it 'executes execute[create-admin-principal] block' do
      expect(chef_run).to run_execute('create-admin-principal')
    end
  end
end
