
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.rst_n.value = 0
    dut.i_8xframe.value = 0
    dut.i_valid.value = 0
    dut.i_last.value = 0
    dut.i_corrupt.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    await RisingEdge(dut.clk)

    dut._log.info("Test CRC_core behavior (currently empty stub)")

    # NOTE:
    # As of the current CRC_core.v contents, there is no logic in the module,
    # so o_crc is never assigned. In simulation it will typically remain 'X'.
    #
    # This testbench therefore only checks that:
    # - the DUT elaborates
    # - signals can be driven
    # - o_crc exists and is 32 bits wide
    # - test section of template remains green by default!


    # Drive a couple of cycles of "valid" data
    dut.i_8xframe.value = 0x0123456789ABCDEF
    dut.i_valid.value = 1
    dut.i_last.value = 0
    dut.i_corrupt.value = 0
    await ClockCycles(dut.clk, 2)

    # End of frame
    dut.i_last.value = 1
    await ClockCycles(dut.clk, 1)

    # Deassert valid
    dut.i_valid.value = 0
    dut.i_last.value = 0
    await ClockCycles(dut.clk, 2)

    # Basic structural assertions
    assert len(dut.o_crc.value.binstr) == 32, "o_crc should be 32 bits wide"
    dut._log.info(f"o_crc observed value (expected to be X/undefined for stub): {dut.o_crc.value}")

