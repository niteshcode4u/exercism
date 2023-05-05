defmodule Username do
  @moduledoc """
  ## Instructions

  You are working as a system administrator for a big company in Munich, Germany. One of your responsibilities is managing email accounts.

  You have been hearing complaints from people saying they are unable to write emails to Mr. Müller. You quickly realize that most of the company uses an old email client that doesn't recognize `müller@firma.de` as a valid email address because of the non-Latin character.

  Telling people to give up their favorite old email client is a lost battle, so you decide to create sanitized aliases for all email accounts.

  ## 1. Sanitize existing usernames by removing everything but lowercase letters

  Implement the `sanitize/1` function. It should accept a username as a charlist and return the username with all characters but lowercase letters removed.

  ```elixir
  Username.sanitize('schmidt1985')
  # => 'schmidt'
  ```

  ## 2. Allow underscores

  Extend the `sanitize/1` function. It should not remove underscores from the username.

  ```elixir
  Username.sanitize('mark_fischer$$$')
  # => 'mark_fischer'
  ```

  ## 3. Substitute German characters

  There are 4 non-Latin characters in the German alphabet, and all of them have commonly-recognized Latin substitutes.

  | German character | Latin substitute |
  | ---------------- | ---------------- |
  | ä                | ae               |
  | ö                | oe               |
  | ü                | ue               |
  | ß                | ss               |

  Extend the `sanitize/1` function. It should substitute German characters according to the table. You can safely assume all usernames are already downcase.

  ```elixir
  Username.sanitize('cäcilie_weiß')
  # => 'caecilie_weiss'
  ```
  """
  @spec sanitize(list) :: list
  def sanitize(username) do
    sanitize(username, '')
  end

  defp sanitize([char | tail], acc) when char in ?a..?z do
    sanitize(tail, [char | acc])
  end

  defp sanitize([char | tail], acc) do
    case char do
      ?ä -> sanitize(tail, [?e | [?a | acc]])
      ?ü -> sanitize(tail, [?e | [?u | acc]])
      ?ö -> sanitize(tail, [?e | [?o | acc]])
      ?ß -> sanitize(tail, [?s | [?s | acc]])
      ?_ -> sanitize(tail, [char | acc])
      _ -> sanitize(tail, acc)
    end
  end

  defp sanitize([], acc), do: Enum.reverse(acc)
end
