local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local f = require("luasnip").function_node

return {
    s("aoc", {
        t({
            "use aoclib::Runner;",
            "",
            "#[derive(Default)]",
            "pub struct Aoc20",
        }),
        i(1),
        t("_"),
        i(2),
        t({
            " {",
            "    // insert items here (or not, i'm not the boss of you)",
            "}",
            "",
            "impl Aoc20",
        }),
        rep(1),
        t("_"),
        rep(2),
        t({
            " {",
            "    pub fn new() -> Self {",
            "        Self::default()",
            "    }",
            "}",
            "",
            "impl Runner for Aoc20",
        }),
        rep(1),
        t("_"),
        rep(2),
        t({
            " {",
            "    fn name(&self) -> (usize, usize) {",
            "        (20",
        }),
        rep(1),
        t(", "),
        f(function(args)
            -- args[1][1] is the text from node 2
            return (args[1][1]:gsub("^0+", ""))
        end, { 2 }),
        t({
            ")",
            "    }",
            "",
            "    fn parse(&mut self) {}",
            "",
            "    fn part1(&mut self) -> Vec<String> {",
            '        aoclib::output("unsolved")',
            "    }",
            "",
            "    fn part2(&mut self) -> Vec<String> {",
            '        aoclib::output("unsolved")',
            "    }",
            "}",
        }),
    }),
}
