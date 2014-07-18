describe Smser do
  before do
    Smser.configuration = Smser::Configuration.new
  end

  it do
    Smser.configure do |config|
      config.default_adapter = :some

      config.adapters.some.tap do |adapter|
        adapter.url = 1
        adapter.login = 2
        adapter.password = 3
      end
    end

    expect(Smser::Sms).to receive(:pass).with('text', 'qwe', {url: 1, login: 2, password: 3})

    Smser.pass 'text', 'qwe'
  end
end