# frozen_string_literal: true

require 'test_helper'

class SerialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @serial = serials(:one)
  end

  test 'should get index' do
    get serials_url
    assert_response :success
  end

  test 'should get new' do
    get new_serial_url
    assert_response :success
  end

  test 'should create serial' do
    assert_difference('Serial.count') do
      post serials_url, params: { serial: { mainTitle: @serial.mainTitle } }
    end

    assert_redirected_to serial_url(Serial.last)
  end

  test 'should show serial' do
    get serial_url(@serial)
    assert_response :success
  end

  test 'should get edit' do
    get edit_serial_url(@serial)
    assert_response :success
  end

  test 'should update serial' do
    patch serial_url(@serial), params: { serial: { mainTitle: @serial.mainTitle } }
    assert_redirected_to serial_url(@serial)
  end

  test 'should destroy serial' do
    assert_difference('Serial.count', -1) do
      delete serial_url(@serial)
    end

    assert_redirected_to serials_url
  end
end
