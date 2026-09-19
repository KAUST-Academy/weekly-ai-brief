from __future__ import annotations

import unittest

from scripts import check_sources


class CheckSourcesTests(unittest.TestCase):
    def test_cited_numbers_includes_direct_and_entry_references(self) -> None:
        tex = r"""
\newcommand{\srcref}[1]{S#1}
\entry{Title}{Org}{https://example.org}{3}
Text \srcref{2}
"""
        self.assertEqual(check_sources.cited_numbers(tex), {2, 3})

    def test_listed_sequence_preserves_duplicates(self) -> None:
        md = "| S1 | a |\n| S2 | b |\n| S2 | c |\n"
        self.assertEqual(check_sources.listed_number_sequence(md), [1, 2, 2])

    def test_valid_numbering_has_no_errors(self) -> None:
        self.assertEqual(check_sources.numbering_errors([1, 2, 3]), [])

    def test_duplicate_source_id_fails(self) -> None:
        errors = check_sources.numbering_errors([1, 2, 2, 3])
        self.assertTrue(any("DUPLICATE" in error for error in errors))

    def test_gap_in_source_ids_fails(self) -> None:
        errors = check_sources.numbering_errors([1, 3])
        self.assertTrue(any("GAP" in error for error in errors))

    def test_out_of_order_source_ids_fail(self) -> None:
        errors = check_sources.numbering_errors([1, 3, 2])
        self.assertTrue(any("ORDER" in error for error in errors))

    def test_empty_source_log_fails(self) -> None:
        errors = check_sources.numbering_errors([])
        self.assertTrue(any("NO SOURCES" in error for error in errors))


if __name__ == "__main__":
    unittest.main()
