require 'test/unit'
require 'hash'
require 'rubygems'
require 'xmlsimple'

class HashTest < Test::Unit::TestCase

  def test_should_lookup_when_key_is_symbol
    a = {:foo => "42"}
    assert_equal "42", a.fetch(:foo)
    assert_equal "42", a[:foo]
    assert_equal "42", a.foo
    assert_equal nil, a.foo_no_aqui
  end

  def test_should_lookup_when_key_is_string
    a = {"foo" => "fnord"}
    assert_equal "fnord", a["foo"]
    assert_equal "fnord", a.foo
    assert_equal nil, a.foo_no_aqui_tambien
  end
  
  def test_should_query_flat_hash
    a = {:foo => "salsa"}
    assert_equal nil, a.foo?.bar
    assert_equal nil, a.samba?.chacha?.rumba?.salsa
    assert_equal "salsa", a.foo
  end
  
  def test_should_query_nested_hash
    a = {:foo => "jazz", :bar => {:baz => "blues"}}
    b = {:baz => "blues"}
    assert_equal "jazz", a.foo
    assert_equal b, a.bar
    assert_equal "blues", a.bar.baz
    assert_equal "blues", a.bar?.baz
    assert_equal({}, a.bar?.baz?)
    assert_equal nil, a.bar?.baz?.tienes_ganas_una_taza_de_cafe
  end
  
  def test_hash_from_xml
    xml =<<XML
<SyncHdr>
  <VerDTD>1.2</VerDTD>
  <VerProto>OMA/1.2</VerProto>
  <SessionID>1</SessionID>
  <MsgID>1</MsgID>
  <Target>
    <LocURI>https://oma.example.com</LocURI>
  </Target>
  <Source>
    <LocURI>OMA123456</LocURI>
  </Source>
  <Cred>
    <Meta>
      <Type>syncml:auth-basic</Type>
      <Format>b64</Format>
    </Meta>
    <Data>ssh_the_pass</Data>
  </Cred>
  <Meta>
    <MaxMsgSize>10700</MaxMsgSize>
  </Meta>
</SyncHdr>
XML
    hash = XmlSimple.xml_in(xml, {"forcearray" => false, "keeproot" => true})
    assert_equal "1.2", hash.SyncHdr?.VerDTD
    assert_equal "ssh_the_pass", hash.SyncHdr?.Cred?.Data
    assert_equal nil, hash.SyncHdr?.Cred?.Meta?.MoreData
    assert_equal "OMA123456", hash.SyncHdr?.Source?.LocURI
  end


end
