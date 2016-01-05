/* Configure your desired default key bindings.
 *
 * Vis stores modes in a tree structure. Key lookup starts in the currently active
 * mode and continues recursively towards the root of the tree until a match is found.
 * This reduces duplication since shared key bindings can be stored in a common
 * ancestor mode.
 *
 * The tree of modes is depicted below. The double line between OPERATOR-OPTION
 * and OPERATOR is only in effect once an operator is detected. That is when
 * entering the OPERATOR mode its parent is set to OPERATOR-OPTION which makes
 * TEXTOBJ reachable. Once the operator is processed (i.e. OPERATOR mode is left)
 * its parent mode is reset back to MOVE.
 *
 * Similarly the +-ed line between OPERATOR and TEXTOBJ is only active within
 * the visual modes.
 *
 *                                         BASIC
 *                                    (arrow keys etc.)
 *                                    /      |
 *               /-------------------/       |
 *            READLINE                      MOVE
 *            /       \                 (h,j,k,l ...)
 *           /         \                     |       \-----------------\
 *          /           \                    |                         |
 *       INSERT       PROMPT             OPERATOR ++++              -TEXTOBJ
 *          |      (history etc)       (d,c,y,p ..)   +      (ia [wsp[]()b<>{}B"'`] )
 *          |                                |     \\  +      +        |
 *          |                                |      \\  +    +         |
 *       REPLACE                           NORMAL    \\  +  +          |
 *                                           |        \\  ++           |
 *                                           |         \\              |
 *                                           |          \\             |
 *                                         VISUAL        \\     OPERATOR-OPTION
 *                                           |            \\        (v,V)
 *                                           |             \\        //
 *                                           |              \\======//
 *                                      VISUAL-LINE
 */

#define ACTION(id) .action = &vis_action[VIS_ACTION_##id],

static KeyBinding basic_movement[] = {
	{ "<C-k>",              ACTION(EDITOR_SUSPEND)                      },
	{ "<Left>",             ACTION(CURSOR_CHAR_PREV)                    },
	{ "<S-Left>",           ACTION(CURSOR_LONGWORD_START_PREV)          },
	{ "<Right>",            ACTION(CURSOR_CHAR_NEXT)                    },
	{ "<S-Right>",          ACTION(CURSOR_LONGWORD_START_NEXT)          },
	{ "<Up>",               ACTION(CURSOR_LINE_UP)                      },
	{ "<Down>",             ACTION(CURSOR_LINE_DOWN)                    },
	{ "<PageUp>",           ACTION(WINDOW_PAGE_UP)                      },
	{ "<PageDown>",         ACTION(WINDOW_PAGE_DOWN)                    },
	{ "<S-PageUp>",         ACTION(WINDOW_HALFPAGE_UP)                  },
	{ "<S-PageDown>",       ACTION(WINDOW_HALFPAGE_DOWN)                },
	{ "<Home>",             ACTION(CURSOR_LINE_BEGIN)                   },
	{ "<End>",              ACTION(CURSOR_LINE_END)                     },
	{ /* empty last element, array terminator */                        },
};

static KeyBinding vis_movements[] = {
	{ "n",                  ACTION(CURSOR_CHAR_PREV)                    },
	{ "d",                  ACTION(CURSOR_CHAR_NEXT)                    },
	{ "t",                  ACTION(CURSOR_LINE_UP)                      },
	{ "r",                  ACTION(CURSOR_LINE_DOWN)                    },
	{ "ot",                 ACTION(CURSOR_SCREEN_LINE_UP)               },
	{ "or",                 ACTION(CURSOR_SCREEN_LINE_DOWN)             },
	{ "^",                  ACTION(CURSOR_LINE_START)                   },
	{ "o_",                 ACTION(CURSOR_LINE_FINISH)                  },
	{ "$",                  ACTION(CURSOR_LINE_END)                     },
	{ "%",                  ACTION(CURSOR_BRACKET_MATCH)                },
	{ "z",                  ACTION(CURSOR_WORD_START_PREV)              },
	{ "Z",                  ACTION(CURSOR_LONGWORD_START_PREV)          },
	{ "v",                  ACTION(CURSOR_WORD_START_NEXT)              },
	{ "V",                  ACTION(CURSOR_LONGWORD_START_NEXT)          },
	{ "ol",                 ACTION(CURSOR_WORD_END_PREV)                },
	{ "oL",                 ACTION(CURSOR_LONGWORD_END_PREV)            },
	{ "l",                  ACTION(CURSOR_WORD_END_NEXT)                },
	{ "L",                  ACTION(CURSOR_LONGWORD_END_NEXT)            },
	{ "{",                  ACTION(CURSOR_PARAGRAPH_PREV)               },
	{ "}",                  ACTION(CURSOR_PARAGRAPH_NEXT)               },
	{ "(",                  ACTION(CURSOR_SENTENCE_PREV)                },
	{ ")",                  ACTION(CURSOR_SENTENCE_NEXT)                },
	{ "[[",                 ACTION(CURSOR_FUNCTION_START_PREV)          },
	{ "[]",                 ACTION(CURSOR_FUNCTION_END_PREV)            },
	{ "][",                 ACTION(CURSOR_FUNCTION_START_NEXT)          },
	{ "]]",                 ACTION(CURSOR_FUNCTION_END_NEXT)            },
	{ "oo",                 ACTION(CURSOR_LINE_FIRST)                   },
	{ "o0",                 ACTION(CURSOR_SCREEN_LINE_BEGIN)            },
	{ "om",                 ACTION(CURSOR_SCREEN_LINE_MIDDLE)           },
	{ "o$",                 ACTION(CURSOR_SCREEN_LINE_END)              },
	{ "O",                  ACTION(CURSOR_LINE_LAST)                    },
	{ "|",                  ACTION(CURSOR_COLUMN)                       },
	{ "b",                  ACTION(CURSOR_SEARCH_NEXT)                  },
	{ "B",                  ACTION(CURSOR_SEARCH_PREV)                  },
	{ "S",                  ACTION(CURSOR_WINDOW_LINE_TOP)              },
	{ "M",                  ACTION(CURSOR_WINDOW_LINE_MIDDLE)           },
	{ "D",                  ACTION(CURSOR_WINDOW_LINE_BOTTOM)           },
	{ "*",                  ACTION(CURSOR_SEARCH_WORD_FORWARD)          },
	{ "#",                  ACTION(CURSOR_SEARCH_WORD_BACKWARD)         },
	{ "e",                  ACTION(TO_RIGHT)                            },
	{ "E",                  ACTION(TO_LEFT)                             },
	{ "w",                  ACTION(TILL_RIGHT)                          },
	{ "W",                  ACTION(TILL_LEFT)                           },
	{ ";",                  ACTION(TOTILL_REPEAT)                       },
	{ ",",                  ACTION(TOTILL_REVERSE)                      },
	{ "/",                  ACTION(PROMPT_SEARCH_FORWARD)               },
	{ "?",                  ACTION(PROMPT_SEARCH_BACKWARD)              },
	{ "`",                  ACTION(MARK_GOTO)                           },
	{ "'",                  ACTION(MARK_GOTO_LINE)                      },
	{ /* empty last element, array terminator */                        },
};

static KeyBinding vis_textobjs[] = {
	{ "uv",                 ACTION(TEXT_OBJECT_WORD_OUTER)              },
	{ "uV",                 ACTION(TEXT_OBJECT_LONGWORD_OUTER)          },
	{ "ui",                 ACTION(TEXT_OBJECT_SENTENCE)                },
	{ "uq",                 ACTION(TEXT_OBJECT_PARAGRAPH)               },
	{ "u[",                 ACTION(TEXT_OBJECT_SQUARE_BRACKET_OUTER)    },
	{ "u(",                 ACTION(TEXT_OBJECT_PARANTHESE_OUTER)        },
	{ "u<",                 ACTION(TEXT_OBJECT_ANGLE_BRACKET_OUTER)     },
	{ "u{",                 ACTION(TEXT_OBJECT_CURLY_BRACKET_OUTER)     },
	{ "u\"",                ACTION(TEXT_OBJECT_QUOTE_OUTER)             },
	{ "u\'",                ACTION(TEXT_OBJECT_SINGLE_QUOTE_OUTER)      },
	{ "u`",                 ACTION(TEXT_OBJECT_BACKTICK_OUTER)          },
	{ "ul",                 ACTION(TEXT_OBJECT_ENTIRE_OUTER)            },
	{ "ue",                 ACTION(TEXT_OBJECT_FUNCTION_OUTER)          },
	{ "ut",                 ACTION(TEXT_OBJECT_LINE_OUTER)              },
	{ "gv",                 ACTION(TEXT_OBJECT_WORD_INNER)              },
	{ "gV",                 ACTION(TEXT_OBJECT_LONGWORD_INNER)          },
	{ "gi",                 ACTION(TEXT_OBJECT_SENTENCE)                },
	{ "gq",                 ACTION(TEXT_OBJECT_PARAGRAPH)               },
	{ "g[",                 ACTION(TEXT_OBJECT_SQUARE_BRACKET_INNER)    },
	{ "g(",                 ACTION(TEXT_OBJECT_PARANTHESE_INNER)        },
	{ "g<",                 ACTION(TEXT_OBJECT_ANGLE_BRACKET_INNER)     },
	{ "g{",                 ACTION(TEXT_OBJECT_CURLY_BRACKET_INNER)     },
	{ "g\"",                ACTION(TEXT_OBJECT_QUOTE_INNER)             },
	{ "g\'",                ACTION(TEXT_OBJECT_SINGLE_QUOTE_INNER)      },
	{ "g`",                 ACTION(TEXT_OBJECT_BACKTICK_INNER)          },
	{ "gl",                 ACTION(TEXT_OBJECT_ENTIRE_INNER)            },
	{ "ge",                 ACTION(TEXT_OBJECT_FUNCTION_INNER)          },
	{ "gt",                 ACTION(TEXT_OBJECT_LINE_INNER)              },
	{ /* empty last element, array terminator */                        },
};

static KeyBinding vis_operators[] = {
	{ "0",                  ACTION(COUNT)                               },
	{ "1",                  ACTION(COUNT)                               },
	{ "2",                  ACTION(COUNT)                               },
	{ "3",                  ACTION(COUNT)                               },
	{ "4",                  ACTION(COUNT)                               },
	{ "5",                  ACTION(COUNT)                               },
	{ "6",                  ACTION(COUNT)                               },
	{ "7",                  ACTION(COUNT)                               },
	{ "8",                  ACTION(COUNT)                               },
	{ "9",                  ACTION(COUNT)                               },
	{ "a",                  ACTION(OPERATOR_DELETE)                     },
	{ "ä",                  ACTION(OPERATOR_CHANGE)                     },
	{ "ü",                  ACTION(OPERATOR_YANK)                       },
	{ "q",                  ACTION(PUT_AFTER)                           },
	{ "Q",                  ACTION(PUT_BEFORE)                          },
	{ "oq",                 ACTION(PUT_AFTER_END)                       },
	{ "oQ",                 ACTION(PUT_BEFORE_END)                      },
	{ ">",                  ACTION(OPERATOR_SHIFT_RIGHT)                },
	{ "<",                  ACTION(OPERATOR_SHIFT_LEFT)                 },
	{ "oH",                 ACTION(OPERATOR_CASE_UPPER)                 },
	{ "~",                  ACTION(OPERATOR_CASE_SWAP)                  },
	{ "o~",                 ACTION(OPERATOR_CASE_SWAP)                  },
	{ "oh",                 ACTION(OPERATOR_CASE_LOWER)                 },
	{ "!",                  ACTION(OPERATOR_FILTER)                     },
	{ "=",                  ACTION(OPERATOR_FILTER_FMT)                 },
	{ "\"",                 ACTION(REGISTER)                            },
	{ /* empty last element, array terminator */                        },
};

static KeyBinding vis_operator_options[] = {
	{ "p",                  ACTION(MOTION_CHARWISE)                     },
	{ "P",                  ACTION(MOTION_LINEWISE)                     },
	{ /* empty last element, array terminator */                        },
};

static KeyBinding vis_mode_normal[] = {
	{ "<Escape>",           ACTION(CURSORS_REMOVE_ALL)                  },
	{ "<C-t>",              ACTION(CURSORS_NEW_LINE_ABOVE)              },
	{ "<C-r>",              ACTION(CURSORS_NEW_LINE_BELOW)              },
	{ "<C-u>",              ACTION(CURSORS_ALIGN)                       },
	{ "<C-b>",              ACTION(CURSOR_SELECT_WORD)                  },
	{ "<C-q>",              ACTION(CURSORS_REMOVE_LAST)                 },
	{ "<C-v>r",             ACTION(WINDOW_NEXT)                         },
	{ "<C-v>t",             ACTION(WINDOW_PREV)                         },
	{ "<C-l>",              ACTION(WINDOW_SLIDE_UP)                     },
	{ "<C-ü>",              ACTION(WINDOW_SLIDE_DOWN)                   },
	{ "<C-f>",              ACTION(JUMPLIST_PREV)                       },
	{ "<C-g>",              ACTION(JUMPLIST_NEXT)                       },
	{ "o;",                 ACTION(CHANGELIST_PREV)                     },
	{ "o,",                 ACTION(CHANGELIST_NEXT)                     },
	{ "u",                  ACTION(APPEND_CHAR_NEXT)                    },
	{ "U",                  ACTION(APPEND_LINE_END)                     },
	{ "G",                  ACTION(INSERT_LINE_START)                   },
	{ ".",                  ACTION(REPEAT)                              },
	{ "f",                  ACTION(OPEN_LINE_BELOW)                     },
	{ "F",                  ACTION(OPEN_LINE_ABOVE)                     },
	{ "R",                  ACTION(JOIN_LINE_BELOW)                     },
	{ "Ö",                  ACTION(DELETE_CHAR_NEXT)                    },
	{ "c",                  ACTION(REPLACE_CHAR)                        },
	{ "g",                  ACTION(MODE_INSERT)                         },
	{ "p",                  ACTION(MODE_VISUAL)                         },
	{ "P",                  ACTION(MODE_VISUAL_LINE)                    },
	{ "C",                  ACTION(MODE_REPLACE)                        },
	{ "h",                  ACTION(UNDO)                                },
	{ "<C-c>",              ACTION(REDO)                                },
	{ "o+",                 ACTION(LATER)                               },
	{ "o-",                 ACTION(EARLIER)                             },
	{ "<C-d>",              ACTION(REDRAW)                              },
	{ ":",                  ACTION(PROMPT_SHOW)                         },
	{ "kw",                 ACTION(WINDOW_REDRAW_TOP)                   },
	{ "kk",                 ACTION(WINDOW_REDRAW_CENTER)                },
	{ "kz",                 ACTION(WINDOW_REDRAW_BOTTOM)                },
	{ "x",                  ACTION(MACRO_RECORD)                        },
	{ "@",                  ACTION(MACRO_REPLAY)                        },
	{ "op",                 ACTION(SELECTION_RESTORE)                   },
	{ "m",                  ACTION(MARK_SET)                            },
	{ "ou",                 ACTION(UNICODE_INFO)                        },
	{ /* empty last element, array terminator */                        },
};

static KeyBinding vis_mode_visual[] = {
	{ "<C-b>",              ACTION(CURSORS_NEW_MATCH_NEXT)              },
	{ "<C-ö>",              ACTION(CURSORS_NEW_MATCH_SKIP)              },
	{ "<C-q>",              ACTION(CURSORS_REMOVE_LAST)                 },
	{ "G",                  ACTION(CURSORS_NEW_LINES_BEGIN)             },
	{ "U",                  ACTION(CURSORS_NEW_LINES_END)               },
	{ "<Escape>",           ACTION(MODE_NORMAL)                         },
	{ "P",                  ACTION(MODE_VISUAL_LINE)                    },
	{ ":",                  ACTION(PROMPT_SHOW_VISUAL)                  },
	{ "R",                  ACTION(JOIN_LINES)                          },
	{ "f",                  ACTION(SELECTION_FLIP)                      },
	{ /* empty last element, array terminator */                        },
};

static KeyBinding vis_mode_visual_line[] = {
	{ "p",                  ACTION(MODE_VISUAL)                         },
	{ "P",                  ACTION(MODE_NORMAL)                         },
	{ /* empty last element, array terminator */                        },
};

static KeyBinding vis_mode_readline[] = {
	{ "<Backspace>",        ACTION(DELETE_CHAR_PREV)                    },
	{ "<Delete>",           ACTION(DELETE_CHAR_NEXT)                    },
	{ "<Escape>",           ACTION(MODE_NORMAL)                         },
	{ "<C-a>",              ACTION(DELETE_CHAR_NEXT)                    },
	{ "<C-v>",              ACTION(DELETE_WORD_PREV)                    },
	{ "<C-h>",              ACTION(DELETE_LINE_BEGIN)                   },
	{ /* empty last element, array terminator */                        },
};

static KeyBinding vis_mode_prompt[] = {
	{ "<Backspace>",        ACTION(PROMPT_BACKSPACE)                    },
	{ "<Enter>",            ACTION(PROMPT_ENTER)                        },
	{ "<Tab>",              ACTION(NOP)                                 },
	{ /* empty last element, array terminator */                        },
};

static KeyBinding vis_mode_insert[] = {
	{ "<Escape>",           ACTION(MODE_NORMAL)                         },
	{ "<Enter>",            ACTION(INSERT_NEWLINE)                      },
	{ "<C-f>",              ACTION(MODE_OPERATOR_PENDING)               },
	{ "<C-p>",              ACTION(INSERT_VERBATIM)                     },
	{ "<C-ö><C-l>",         ACTION(WINDOW_SLIDE_UP)                     },
	{ "<C-ö><C-ü>",         ACTION(WINDOW_SLIDE_DOWN)                   },
	{ "<Tab>",              ACTION(INSERT_TAB)                          },
	{ "<C-c>",              ACTION(INSERT_REGISTER)                     },
	{ /* empty last element, array terminator */                        },
};

static KeyBinding vis_mode_replace[] = {
	{ /* empty last element, array terminator */                        },
};
