![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# UWASIC W26: FCS Engine

## Getting Started

1. Clone this repository
2. Update [info.yaml](info.yaml) with your project details
3. Make a post in the [UWASIC Discord server](https://discord.gg/ZcfXmCkV) under **#onboarding/posts** to kick things off!
4. [Read the full documentation and specifications here](https://docs.uwasic.com/doc/crc32-engine-1nPI6NYk4L)

## Disclaimer

The final implementation will be integrated into an FPGA fabric of a larger SoC. This TinyTapeout template serves as a trackable starting point for initial prototyping and team training purposes.

## Set up your Verilog project

1. Add your Verilog files to the `src` folder.
2. Edit the [info.yaml](info.yaml) and update information about your project, paying special attention to the `source_files` and `top_module` properties. 
3. Edit [docs/info.md](docs/info.md) weekly and document your weekly progress on RTL and Verification, along with any comments or concerns you may have.

The GitHub action will automatically build the ASIC files using [OpenLane](https://www.zerotoasiccourse.com/terminology/openlane/).

## Writing cocotb Testbenches

This template design has a two-level hierarchy:
- **`CRC_core`** (submodule): Core CRC computation engine (your main task)
- **`tt_um_FCS_yourname`** (top module): Wrapper with TinyTapeout standard I/O interfaces

**For now, focus verification efforts on `CRC_core` only.** The testbench instantiates `CRC_core` directly, allowing you to thoroughly verify the core algorithm logic before integrating it into the top module. This approach isolates and tests the critical CRC computation logic first.

> **Note:** If you're more comfortable using Verilog or SystemVerilog testbenches for verification, feel free to use those instead of cocotb.

## Enable GitHub actions to build the results page

- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## Resources

- [Documentation](https://docs.uwasic.com/doc/crc32-engine-1nPI6NYk4L)
- [An interesting insight on implementing CRC math onto hardware](https://youtu.be/sNkERQlK8j8?si=1aVVNF5dmEeVRrsh)
- [CRC calculator](https://crccalc.com/?crc=123456789&method=&datatype=ascii&outtype=hex)
- [UWASIC discord server](https://discord.gg/ZcfXmCkV)

