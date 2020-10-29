# Who can commit?

Anyone can make pull requests. Currently the FoundationDB team at Apple is controlling the list of contributors who can merge PRs. However, there are a few rules for these people:

## Rules for People with Merge-Rights

1. Only merge PRs for which you are the assignee. The only exception to that is if the assignee does not have merge-rights and asks you to click the merge button.
1. Only merge a PR if CI successfully finished. The only exception to that are changes that are expected to break CI (for example changes to docker containers). "This change is trivial" is not a valid reason to merge before CI is done!
1. Never merge a draft PR. You can reach out to an author and ask them to make the PR a non-draft.
1. Never merge your own PRs. There are no exceptions to this. If a merge is very time sensitive there should be options to reach someone at any time of day (Snowflake employees for example can use pager-duty to page a tech lead).
1. A PR needs at least one approved review.

## Rules for PRs

1. If a PR is not done done (code complete, test complete, and performance tested) it should be a draft PR. Only if the authors believes that the PR can be merged as is, it should be a non-draft PR.
1. If the author wants reviewers to look at the code, the label `RFC` should be applied.
1. If the author wants to talk about the change in our weekly meeting, the label `needs-discussion` should be applied.

# Code Review

**Never be offended if a PR is rejected by a reviewer!**

Doing a good job in a code review can save us (and our build cops!) a lot of trouble down the road. Please take this job seriously. If you're unsure whether a code-change has a high enough quality in order to be merged, it probably hasn't. You can use the points below as a check-list:

## Code Style
* **Variable and Function Names**
  Do variable and function names make sense for what they mean / how they are used?  Often during development the role of a variable or function can drift, a reviewer’s fresh perspective might notice confusing names more easily than the original developer.  

## Performance

* **Are all CPU-hot paths well optimized?**
  Try to look out for hot paths. Usually we don’t care as much about code that runs very rarely if it is not optimal. However, if you find anything new in a hot code path (for example the commitBatch function in the proxy), be extra careful and look for things that can be optimized.
* **STL containers**
  Using STL containers is generally fine. However, for many containers we have specialized implementations and often they will perform better in FDB. For example: whenever you see a std::vector<T> check whether a VectorRef would make more sense in that context.

## Testing

* **Is the code tested in Simulation?**
  For all new introduced code there should be at least one simulation test that verifies that this code works as expected. In many cases existing tests will cover this already.
* **Were simulation tests run on this PR?**
  Not all contributors have easy access to, or automatically run, a larger-than-one-ctest amount of correctness. In these cases, you can run it on either Apple or Snowflake architecture. Please don't rely on our nightlies to do this work for you.
* **Are ASSERT, ASSERT_WE_THINK, and TEST appropriately and correctly used?**
  Assertions about invariants are always nice to have.  They can also be made simulation-only.  Code paths that are required to have meaningful and good testing coverage should have a TEST() macro to ensure that they are actually tested.
* **Does it make sense to have unit-tests?**
  We don’t do too much unit-testing in fdb. But for some components it might still be worth adding unit tests (like new data structures)
* **For bug fixes: is there a test that catches regressions?**
  For bugs that we do not find in simulation, we should first try to write a test that reproduces the problem before fixing it.
