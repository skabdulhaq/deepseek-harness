/** Browser-safe UUID generation for client-side wire correlation. */

/**
 * Re-export from the wire layer so every browser bundle shares one
 * implementation (apiproxy is INLINE_SAFE for client-bundle purity).
 * @returns a UUID backed by `crypto.getRandomValues()`, which browsers expose on insecure origins.
 */
export { randomUuid } from '@deepseek-ai/dsh-host-apiproxy/client'
