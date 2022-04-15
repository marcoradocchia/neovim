return {
  s(
    { trig = "ifmain", name = "if main" },
    fmt([[
      def main() -> None:
          {}


      if __name__ == "__main__":
          main()
    ]], { i(1) })
  ),
  s(
    { trig = "class", name = "class" },
    fmt([[
      class {}:
          def __init__(self) -> None:
              {}
    ]], { i(1), i(2) })
  )
}, {

}
