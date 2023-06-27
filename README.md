# bugger-sample
1. start `truffle dashboard`
2. `truffle console`
3. Enter the following in console
   ```console
   C = await artifacts.require("C")
   c = await C.new()
   await c.main()
   ```
4. grab tx and use dashboard debugger
