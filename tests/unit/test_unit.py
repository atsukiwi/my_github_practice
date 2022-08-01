import pytest
from tasks import task0

@pytest.mark.parametrize("a",[1,2,3])
def test_unit_hoge(a):
    a_expected = a + 1
    a_result = task0.func_hoge(a)
    assert a_expected == a_result

@pytest.mark.parametrize("a",["a", 1])
def test_unit_fuga(a):
    a_expected = str(a) + "_OUTPUT"
    a_result = task0.func_fuga(a)
    assert a_expected == a_result

